import copy
import os
from utils.flax_utils import restore_agent, save_agent

class MultiAgentManager:
    def __init__(self, agent_class, n_agents, seed, partition_example_batch, config):
        self.agents = {
            i: agent_class.create(
                seed,
                partition_example_batch[i]['observations'],
                partition_example_batch[i]['actions'],
                config,
            )
            for i in range(n_agents)
        }

    def update(self, partitioned_batch):
        update_infos = {}
        for i in self.agents:
            self.agents[i], update_info = self.agents[i].update(partitioned_batch[i])
            update_infos[i] = update_info
        return update_infos

    def evaluate(self):
        return self.agents

    def total_loss(self, val_batches):
        val_infos = {}
        for i in self.agents:
            _, val_info = self.agents[i].total_loss(val_batches[i], grad_params=None)
            val_infos[i] = val_info
        return val_infos

    def save(self, save_dir, step):
        for i, agent in self.agents.items():
            agent_dir = os.path.join(save_dir, f"agent_{i}")
            os.makedirs(agent_dir, exist_ok=True)  # 确保目录存在
            save_agent(agent, agent_dir, step)

    def restore(self, restore_path, epoch):
        for i in self.agents:
            agent_dir = os.path.join(restore_path, f"agent_{i}")
            os.makedirs(agent_dir, exist_ok=True)  # 确保目录存在
            self.agents[i] = restore_agent(self.agents[i], agent_dir, epoch)

    def deepcopy(self, to_cpu=False):
        import jax
        copied = copy.deepcopy(self.agents)
        if to_cpu:
            for i in copied:
                copied[i] = jax.device_put(copied[i], device=jax.devices('cpu')[0])
        return copied
