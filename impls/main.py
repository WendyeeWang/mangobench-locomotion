import json
import os
# os.environ["WANDB_MODE"] = "disabled"  # 禁用 wandb

import random
import time
from collections import defaultdict

import jax
import numpy as np
import tqdm
import wandb
from absl import app, flags
from agents import agents
from ml_collections import config_flags
from utils.datasets import Dataset, GCDataset, HGCDataset
from utils.env_utils import make_env_and_datasets
from utils.evaluation import evaluate
from utils.flax_utils import restore_agent, save_agent
from utils.log_utils import CsvLogger, get_exp_name, get_flag_dict, get_wandb_video, setup_wandb
#modified:
from MujocoMulti import batch_partition
import copy
from utils.multiagent_manager import MultiAgentManager
FLAGS = flags.FLAGS

flags.DEFINE_string('run_group', 'Debug', 'Run group.')
flags.DEFINE_integer('seed', 0, 'Random seed.')
flags.DEFINE_string('env_name', 'antmaze-large-navigate-v0', 'Environment (dataset) name.')
flags.DEFINE_string('save_dir', 'exp/', 'Save directory.')
flags.DEFINE_string('restore_path', None, 'Restore path.')
flags.DEFINE_integer('restore_epoch', None, 'Restore epoch.')

flags.DEFINE_integer('train_steps', 1000000, 'Number of training steps.')
flags.DEFINE_integer('log_interval', 5000, 'Logging interval.')
flags.DEFINE_integer('eval_interval', 100000, 'Evaluation interval.')
flags.DEFINE_integer('save_interval', 1000000, 'Saving interval.')

flags.DEFINE_integer('eval_tasks', None, 'Number of tasks to evaluate (None for all).')
flags.DEFINE_integer('eval_episodes', 20, 'Number of episodes for each task.')
flags.DEFINE_float('eval_temperature', 0, 'Actor temperature for evaluation.')
flags.DEFINE_float('eval_gaussian', None, 'Action Gaussian noise for evaluation.')
flags.DEFINE_integer('video_episodes', 1, 'Number of video episodes for each task.')
flags.DEFINE_integer('video_frame_skip', 3, 'Frame skip for videos.')
flags.DEFINE_integer('eval_on_cpu', 1, 'Whether to evaluate on CPU.')
config_flags.DEFINE_config_file('agent', 'agents/gciql.py', lock_config=False)
#modified:
flags.DEFINE_integer('n_agents', 2, 'Number of agents.')
flags.DEFINE_string('scenario', 'manyagent_ant', 'multi-agent name.')
flags.DEFINE_string('agent_conf', 'None', 'multi-agent config.')



def main(_):
    # Set up logger.
    exp_name = get_exp_name(FLAGS.seed)
    # setup_wandb(project='MANGOBench', group=FLAGS.run_group, name=exp_name)
    #modified:
    agent_name = getattr(FLAGS.agent, 'agent_name', 'default_agent')  # Default if not found
    # setup_wandb(project=FLAGS.env_name, group=FLAGS.run_group, name=agent_name+FLAGS.agent_conf)
    # FLAGS.save_dir = os.path.join(FLAGS.save_dir, wandb.run.project, FLAGS.run_group, exp_name)
    FLAGS.save_dir = os.path.join(FLAGS.save_dir, 'MANGOBench', FLAGS.run_group, exp_name, FLAGS.env_name+FLAGS.agent_conf+agent_name)
    os.makedirs(FLAGS.save_dir, exist_ok=True)
    with open(os.path.join(FLAGS.save_dir, 'flags.json'), 'w') as f:
        json.dump(get_flag_dict(), f)

    # Set up environment and dataset.
    config = FLAGS.agent
    env, train_dataset, val_dataset = make_env_and_datasets(FLAGS.env_name, frame_stack=config['frame_stack'])

    dataset_class = {
        'GCDataset': GCDataset,
        'HGCDataset': HGCDataset,
    }[config['dataset_class']]
    train_dataset = dataset_class(Dataset.create(**train_dataset), config)
    if val_dataset is not None:
        val_dataset = dataset_class(Dataset.create(**val_dataset), config)

    # Set random seeds.
    random.seed(FLAGS.seed)
    np.random.seed(FLAGS.seed)

    example_batch = train_dataset.sample(1)
    if config['discrete']:
        example_batch['actions'] = np.full_like(example_batch['actions'], env.action_space.n - 1)

    # Initialize agent(s).
    agent_class = agents[config['agent_name']]
    if FLAGS.agent_conf != 'None':
        partition_example_batch = batch_partition(example_batch, FLAGS.agent_conf, FLAGS.scenario)
        agent_manager = MultiAgentManager(agent_class, FLAGS.n_agents, FLAGS.seed, partition_example_batch, config)
    else:
        agent = agent_class.create(FLAGS.seed, example_batch['observations'], example_batch['actions'], config)
    # print("example_batch",example_batch)
    # print("actions.shape",example_batch["actions"].shape)
    # print("observations.shape",example_batch["observations"].shape)
    # Restore if needed.
    if FLAGS.restore_path is not None:
        if FLAGS.agent_conf != 'None':
            agent_manager.restore(FLAGS.restore_path, FLAGS.restore_epoch)
        else:
            agent = restore_agent(agent, FLAGS.restore_path, FLAGS.restore_epoch)

    # Training loop.
    train_logger = CsvLogger(os.path.join(FLAGS.save_dir, 'train.csv'))
    eval_logger = CsvLogger(os.path.join(FLAGS.save_dir, 'eval.csv'))
    first_time = time.time()
    last_time = time.time()

    for i in tqdm.tqdm(range(1, FLAGS.train_steps + 1), smoothing=0.1, dynamic_ncols=True):
        batch = train_dataset.sample(config['batch_size'])

        # Update agent(s)
        if FLAGS.agent_conf != 'None':
            partition_batch = batch_partition(batch, FLAGS.agent_conf, FLAGS.scenario)
            update_infos = agent_manager.update(partition_batch)
        else:
            agent, update_info = agent.update(batch)

        # Logging
        if i % FLAGS.log_interval == 0:
            train_metrics = {}

            if FLAGS.agent_conf != 'None':
                for agent_id, update_info in update_infos.items():
                    train_metrics.update({f'training/agent{agent_id}_{k}': v for k, v in update_info.items()})
            else:
                train_metrics.update({f'training/{k}': v for k, v in update_info.items()})

            if val_dataset is not None:
                val_batch = val_dataset.sample(config['batch_size'])
                if FLAGS.agent_conf != 'None':
                    partition_val_batch = batch_partition(val_batch, FLAGS.agent_conf, FLAGS.scenario)
                    val_infos = agent_manager.total_loss(partition_val_batch)
                    for agent_id, val_info in val_infos.items():
                        train_metrics.update({f'validation/agent{agent_id}_{k}': v for k, v in val_info.items()})
                else:
                    _, val_info = agent.total_loss(val_batch, grad_params=None)
                    train_metrics.update({f'validation/{k}': v for k, v in val_info.items()})

            train_metrics['time/epoch_time'] = (time.time() - last_time) / FLAGS.log_interval
            train_metrics['time/total_time'] = time.time() - first_time
            last_time = time.time()
            # wandb.log(train_metrics, step=i)
            train_logger.log(train_metrics, step=i)

        # Evaluation
        if i == 1 or i % FLAGS.eval_interval == 0:
            if FLAGS.agent_conf != 'None':
                eval_agent = agent_manager.deepcopy(to_cpu=bool(FLAGS.eval_on_cpu))
            else:
                eval_agent = jax.device_put(agent, device=jax.devices('cpu')[0]) if FLAGS.eval_on_cpu else agent

            renders = []
            eval_metrics = {}
            overall_metrics = defaultdict(list)
            task_infos = env.unwrapped.task_infos if hasattr(env.unwrapped, 'task_infos') else env.task_infos
            num_tasks = FLAGS.eval_tasks if FLAGS.eval_tasks is not None else len(task_infos)

            for task_id in tqdm.trange(1, num_tasks + 1):
                task_name = task_infos[task_id - 1]['task_name']
                eval_info, trajs, cur_renders = evaluate(
                    agent=eval_agent,
                    env=env,
                    task_id=task_id,
                    config=config,
                    num_eval_episodes=FLAGS.eval_episodes,
                    num_video_episodes=FLAGS.video_episodes,
                    video_frame_skip=FLAGS.video_frame_skip,
                    eval_temperature=FLAGS.eval_temperature,
                    eval_gaussian=FLAGS.eval_gaussian,
                    scenario=FLAGS.scenario,
                    agent_conf=FLAGS.agent_conf,
                    n_agents=FLAGS.n_agents
                )
                renders.extend(cur_renders)
                metric_names = ['success']
                eval_metrics.update(
                    {f'evaluation/{task_name}_{k}': v for k, v in eval_info.items() if k in metric_names}
                )
                for k, v in eval_info.items():
                    if k in metric_names:
                        overall_metrics[k].append(v)

            for k, v in overall_metrics.items():
                eval_metrics[f'evaluation/overall_{k}'] = np.mean(v)

            if FLAGS.video_episodes > 0:
                video = get_wandb_video(renders=renders, n_cols=num_tasks)
                eval_metrics['video'] = video

            # wandb.log(eval_metrics, step=i)
            eval_logger.log(eval_metrics, step=i)

        # Save
        if i % FLAGS.save_interval == 0:
            if FLAGS.agent_conf != 'None':
                agent_manager.save(FLAGS.save_dir, i)
            else:
                save_agent(agent, FLAGS.save_dir, i)

    train_logger.close()
    eval_logger.close()

if __name__ == '__main__':
    app.run(main)
