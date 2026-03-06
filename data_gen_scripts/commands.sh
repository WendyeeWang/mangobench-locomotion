# Commands to train expert policies.

# ant (online-ant-xy-v0)
python main_sac.py --env_name=online-ant-xy-v0 --train_steps=400000 --eval_interval=100000 --save_interval=400000 --log_interval=5000
# antball (online-antball-v0)
python main_sac.py --env_name=online-antball-v0 --train_steps=12000000 --train_interval=4 --eval_interval=500000 --save_interval=12000000 --log_interval=20000 --agent.layer_norm=True --terminate_at_end=1
# humanoid (online-humanoid-xy-v0)
python main_sac.py --env_name=online-humanoid-xy-v0 --train_steps=40000000 --train_interval=4 --eval_interval=500000 --save_interval=40000000 --log_interval=20000 --agent.value_hidden_dims="(1024, 1024, 1024)" --agent.layer_norm=True --agent.min_q=False


# Commands to reproduce datasets.

# pointmaze-medium-navigate-v0
python generate_locomaze.py --env_name=pointmaze-medium-v0 --save_path=data/pointmaze-medium-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --noise=0.5
# pointmaze-large-navigate-v0
python generate_locomaze.py --env_name=pointmaze-large-v0 --save_path=data/pointmaze-large-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --noise=0.5
# pointmaze-giant-navigate-v0
python generate_locomaze.py --env_name=pointmaze-giant-v0 --save_path=data/pointmaze-giant-navigate-v0.npz --dataset_type=navigate --num_episodes=500 --max_episode_steps=2001 --noise=0.5
# pointmaze-teleport-navigate-v0
python generate_locomaze.py --env_name=pointmaze-teleport-v0 --save_path=data/pointmaze-teleport-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --noise=0.5
# pointmaze-medium-stitch-v0
python generate_locomaze.py --env_name=pointmaze-medium-v0 --save_path=data/pointmaze-medium-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --noise=0.5
# pointmaze-large-stitch-v0
python generate_locomaze.py --env_name=pointmaze-large-v0 --save_path=data/pointmaze-large-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --noise=0.5
# pointmaze-giant-stitch-v0
python generate_locomaze.py --env_name=pointmaze-giant-v0 --save_path=data/pointmaze-giant-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --noise=0.5
# pointmaze-teleport-stitch-v0
python generate_locomaze.py --env_name=pointmaze-teleport-v0 --save_path=data/pointmaze-teleport-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --noise=0.5

# antmaze-medium-navigate-v0
python generate_locomaze.py --env_name=antmaze-medium-v0 --save_path=data/antmaze-medium-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --restore_path=experts/ant --restore_epoch=400000
# antmaze-large-navigate-v0
python generate_locomaze.py --env_name=antmaze-large-v0 --save_path=data/antmaze-large-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --restore_path=experts/ant --restore_epoch=400000
# antmaze-giant-navigate-v0
python generate_locomaze.py --env_name=antmaze-giant-v0 --save_path=data/antmaze-giant-navigate-v0.npz --dataset_type=navigate --num_episodes=500 --max_episode_steps=2001 --restore_path=experts/ant --restore_epoch=400000
# antmaze-teleport-navigate-v0
python generate_locomaze.py --env_name=antmaze-teleport-v0 --save_path=data/antmaze-teleport-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --restore_path=experts/ant --restore_epoch=400000
# antmaze-medium-stitch-v0
python generate_locomaze.py --env_name=antmaze-medium-v0 --save_path=data/antmaze-medium-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# antmaze-large-stitch-v0
python generate_locomaze.py --env_name=antmaze-large-v0 --save_path=data/antmaze-large-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# antmaze-giant-stitch-v0
python generate_locomaze.py --env_name=antmaze-giant-v0 --save_path=data/antmaze-giant-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# antmaze-teleport-stitch-v0
python generate_locomaze.py --env_name=antmaze-teleport-v0 --save_path=data/antmaze-teleport-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# antmaze-medium-explore-v0
python generate_locomaze.py --env_name=antmaze-medium-v0 --save_path=data/antmaze-medium-explore-v0.npz --dataset_type=explore --num_episodes=10000 --max_episode_steps=501 --noise=1.0 --restore_path=experts/ant --restore_epoch=400000
# antmaze-large-explore-v0
python generate_locomaze.py --env_name=antmaze-large-v0 --save_path=data/antmaze-large-explore-v0.npz --dataset_type=explore --num_episodes=10000 --max_episode_steps=501 --noise=1.0 --restore_path=experts/ant --restore_epoch=400000
# antmaze-teleport-explore-v0
python generate_locomaze.py --env_name=antmaze-teleport-v0 --save_path=data/antmaze-teleport-explore-v0.npz --dataset_type=explore --num_episodes=10000 --max_episode_steps=501 --noise=1.0 --restore_path=experts/ant --restore_epoch=400000

# humanoidmaze-medium-navigate-v0
python generate_locomaze.py --env_name=humanoidmaze-medium-v0 --save_path=data/humanoidmaze-medium-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=2001 --restore_path=experts/humanoid --restore_epoch=40000000
# humanoidmaze-large-navigate-v0
python generate_locomaze.py --env_name=humanoidmaze-large-v0 --save_path=data/humanoidmaze-large-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=2001 --restore_path=experts/humanoid --restore_epoch=40000000
# humanoidmaze-giant-navigate-v0
python generate_locomaze.py --env_name=humanoidmaze-giant-v0 --save_path=data/humanoidmaze-giant-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=4001 --restore_path=experts/humanoid --restore_epoch=40000000
# humanoidmaze-medium-stitch-v0
python generate_locomaze.py --env_name=humanoidmaze-medium-v0 --save_path=data/humanoidmaze-medium-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=401 --restore_path=experts/humanoid --restore_epoch=40000000
# humanoidmaze-large-stitch-v0
python generate_locomaze.py --env_name=humanoidmaze-large-v0 --save_path=data/humanoidmaze-large-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=401 --restore_path=experts/humanoid --restore_epoch=40000000
# humanoidmaze-giant-stitch-v0
python generate_locomaze.py --env_name=humanoidmaze-giant-v0 --save_path=data/humanoidmaze-giant-stitch-v0.npz --dataset_type=stitch --num_episodes=10000 --max_episode_steps=401 --restore_path=experts/humanoid --restore_epoch=40000000

# antsoccer-arena-navigate-v0
python generate_antsoccer.py --env_name=antsoccer-arena-v0 --save_path=data/antsoccer-arena-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --loco_restore_path=experts/ant --loco_restore_epoch=400000 --ball_restore_path=experts/antball --ball_restore_epoch=12000000
# antsoccer-medium-navigate-v0
python generate_antsoccer.py --env_name=antsoccer-medium-v0 --save_path=data/antsoccer-medium-navigate-v0.npz --dataset_type=navigate --num_episodes=4000 --max_episode_steps=1001 --loco_restore_path=experts/ant --loco_restore_epoch=400000 --ball_restore_path=experts/antball --ball_restore_epoch=12000000
# antsoccer-arena-stitch-v0
python generate_antsoccer.py --env_name=antsoccer-arena-v0 --save_path=data/antsoccer-arena-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --loco_restore_path=experts/ant --loco_restore_epoch=400000 --ball_restore_path=experts/antball --ball_restore_epoch=12000000
# antsoccer-medium-stitch-v0
python generate_antsoccer.py --env_name=antsoccer-medium-v0 --save_path=data/antsoccer-medium-stitch-v0.npz --dataset_type=stitch --num_episodes=8000 --max_episode_steps=501 --loco_restore_path=experts/ant --loco_restore_epoch=400000 --ball_restore_path=experts/antball --ball_restore_epoch=12000000

# visual-antmaze-medium-navigate-v0
python generate_locomaze.py --env_name=visual-antmaze-medium-v0 --save_path=data/visual-antmaze-medium-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-large-navigate-v0
python generate_locomaze.py --env_name=visual-antmaze-large-v0 --save_path=data/visual-antmaze-large-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-giant-navigate-v0
python generate_locomaze.py --env_name=visual-antmaze-giant-v0 --save_path=data/visual-antmaze-giant-navigate-v0.npz --dataset_type=navigate --num_episodes=500 --max_episode_steps=2001 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-teleport-navigate-v0
python generate_locomaze.py --env_name=visual-antmaze-teleport-v0 --save_path=data/visual-antmaze-teleport-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=1001 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-medium-stitch-v0
python generate_locomaze.py --env_name=visual-antmaze-medium-v0 --save_path=data/visual-antmaze-medium-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-large-stitch-v0
python generate_locomaze.py --env_name=visual-antmaze-large-v0 --save_path=data/visual-antmaze-large-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-giant-stitch-v0
python generate_locomaze.py --env_name=visual-antmaze-giant-v0 --save_path=data/visual-antmaze-giant-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-teleport-stitch-v0
python generate_locomaze.py --env_name=visual-antmaze-teleport-v0 --save_path=data/visual-antmaze-teleport-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=201 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-medium-explore-v0
python generate_locomaze.py --env_name=visual-antmaze-medium-v0 --save_path=data/visual-antmaze-medium-explore-v0.npz --dataset_type=explore --num_episodes=10000 --max_episode_steps=501 --noise=1.0 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-large-explore-v0
python generate_locomaze.py --env_name=visual-antmaze-large-v0 --save_path=data/visual-antmaze-large-explore-v0.npz --dataset_type=explore --num_episodes=10000 --max_episode_steps=501 --noise=1.0 --restore_path=experts/ant --restore_epoch=400000
# visual-antmaze-teleport-explore-v0
python generate_locomaze.py --env_name=visual-antmaze-teleport-v0 --save_path=data/visual-antmaze-teleport-explore-v0.npz --dataset_type=explore --num_episodes=10000 --max_episode_steps=501 --noise=1.0 --restore_path=experts/ant --restore_epoch=400000

# visual-humanoidmaze-medium-navigate-v0
python generate_locomaze.py --env_name=visual-humanoidmaze-medium-v0 --save_path=data/visual-humanoidmaze-medium-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=2001 --restore_path=experts/humanoid --restore_epoch=40000000
# visual-humanoidmaze-large-navigate-v0
python generate_locomaze.py --env_name=visual-humanoidmaze-large-v0 --save_path=data/visual-humanoidmaze-large-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=2001 --restore_path=experts/humanoid --restore_epoch=40000000
# visual-humanoidmaze-giant-navigate-v0
python generate_locomaze.py --env_name=visual-humanoidmaze-giant-v0 --save_path=data/visual-humanoidmaze-giant-navigate-v0.npz --dataset_type=navigate --num_episodes=1000 --max_episode_steps=4001 --restore_path=experts/humanoid --restore_epoch=40000000
# visual-humanoidmaze-medium-stitch-v0
python generate_locomaze.py --env_name=visual-humanoidmaze-medium-v0 --save_path=data/visual-humanoidmaze-medium-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=401 --restore_path=experts/humanoid --restore_epoch=40000000
# visual-humanoidmaze-large-stitch-v0
python generate_locomaze.py --env_name=visual-humanoidmaze-large-v0 --save_path=data/visual-humanoidmaze-large-stitch-v0.npz --dataset_type=stitch --num_episodes=5000 --max_episode_steps=401 --restore_path=experts/humanoid --restore_epoch=40000000
# visual-humanoidmaze-giant-stitch-v0
python generate_locomaze.py --env_name=visual-humanoidmaze-giant-v0 --save_path=data/visual-humanoidmaze-giant-stitch-v0.npz --dataset_type=stitch --num_episodes=10000 --max_episode_steps=401 --restore_path=experts/humanoid --restore_epoch=40000000

# cube-single-play-v0
python generate_manipspace.py --env_name=cube-single-v0 --save_path=data/cube-single-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# cube-double-play-v0
python generate_manipspace.py --env_name=cube-double-v0 --save_path=data/cube-double-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# cube-triple-play-v0
python generate_manipspace.py --env_name=cube-triple-v0 --save_path=data/cube-triple-play-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=play
# cube-quadruple-play-v0
python generate_manipspace.py --env_name=cube-quadruple-v0 --save_path=data/cube-quadruple-play-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=play
# cube-single-noisy-v0
python generate_manipspace.py --env_name=cube-single-v0 --save_path=data/cube-single-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1
# cube-double-noisy-v0
python generate_manipspace.py --env_name=cube-double-v0 --save_path=data/cube-double-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1
# cube-triple-noisy-v0
python generate_manipspace.py --env_name=cube-triple-v0 --save_path=data/cube-triple-noisy-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1
# cube-quadruple-noisy-v0
python generate_manipspace.py --env_name=cube-quadruple-v0 --save_path=data/cube-quadruple-noisy-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1

# scene-play-v0
python generate_manipspace.py --env_name=scene-v0 --save_path=data/scene-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# scene-noisy-v0
python generate_manipspace.py --env_name=scene-v0 --save_path=data/scene-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1

# puzzle-3x3-play-v0
python generate_manipspace.py --env_name=puzzle-3x3-v0 --save_path=data/puzzle-3x3-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# puzzle-4x4-play-v0
python generate_manipspace.py --env_name=puzzle-4x4-v0 --save_path=data/puzzle-4x4-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# puzzle-4x5-play-v0
python generate_manipspace.py --env_name=puzzle-4x5-v0 --save_path=data/puzzle-4x5-play-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=play
# puzzle-4x6-play-v0
python generate_manipspace.py --env_name=puzzle-4x6-v0 --save_path=data/puzzle-4x6-play-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=play
# puzzle-3x3-noisy-v0
python generate_manipspace.py --env_name=puzzle-3x3-v0 --save_path=data/puzzle-3x3-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2
# puzzle-4x4-noisy-v0
python generate_manipspace.py --env_name=puzzle-4x4-v0 --save_path=data/puzzle-4x4-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2
# puzzle-4x5-noisy-v0
python generate_manipspace.py --env_name=puzzle-4x5-v0 --save_path=data/puzzle-4x5-noisy-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2
# puzzle-4x6-noisy-v0
python generate_manipspace.py --env_name=puzzle-4x6-v0 --save_path=data/puzzle-4x6-noisy-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2

# visual-cube-single-play-v0
python generate_manipspace.py --env_name=visual-cube-single-v0 --save_path=data/visual-cube-single-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# visual-cube-double-play-v0
python generate_manipspace.py --env_name=visual-cube-double-v0 --save_path=data/visual-cube-double-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# visual-cube-triple-play-v0
python generate_manipspace.py --env_name=visual-cube-triple-v0 --save_path=data/visual-cube-triple-play-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=play
# visual-cube-quadruple-play-v0
python generate_manipspace.py --env_name=visual-cube-quadruple-v0 --save_path=data/visual-cube-quadruple-play-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=play
# visual-cube-single-noisy-v0
python generate_manipspace.py --env_name=visual-cube-single-v0 --save_path=data/visual-cube-single-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1
# visual-cube-double-noisy-v0
python generate_manipspace.py --env_name=visual-cube-double-v0 --save_path=data/visual-cube-double-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1
# visual-cube-triple-noisy-v0
python generate_manipspace.py --env_name=visual-cube-triple-v0 --save_path=data/visual-cube-triple-noisy-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1
# visual-cube-quadruple-noisy-v0
python generate_manipspace.py --env_name=visual-cube-quadruple-v0 --save_path=data/visual-cube-quadruple-noisy-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1

# visual-scene-play-v0
python generate_manipspace.py --env_name=visual-scene-v0 --save_path=data/visual-scene-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# visual-scene-noisy-v0
python generate_manipspace.py --env_name=visual-scene-v0 --save_path=data/visual-scene-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.1

# visual-puzzle-3x3-play-v0
python generate_manipspace.py --env_name=visual-puzzle-3x3-v0 --save_path=data/visual-puzzle-3x3-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# visual-puzzle-4x4-play-v0
python generate_manipspace.py --env_name=visual-puzzle-4x4-v0 --save_path=data/visual-puzzle-4x4-play-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=play
# visual-puzzle-4x5-play-v0
python generate_manipspace.py --env_name=visual-puzzle-4x5-v0 --save_path=data/visual-puzzle-4x5-play-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=play
# visual-puzzle-4x6-play-v0
python generate_manipspace.py --env_name=visual-puzzle-4x6-v0 --save_path=data/visual-puzzle-4x6-play-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=play
# visual-puzzle-3x3-noisy-v0
python generate_manipspace.py --env_name=visual-puzzle-3x3-v0 --save_path=data/visual-puzzle-3x3-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2
# visual-puzzle-4x4-noisy-v0
python generate_manipspace.py --env_name=visual-puzzle-4x4-v0 --save_path=data/visual-puzzle-4x4-noisy-v0.npz --num_episodes=1000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2
# visual-puzzle-4x5-noisy-v0
python generate_manipspace.py --env_name=visual-puzzle-4x5-v0 --save_path=data/visual-puzzle-4x5-noisy-v0.npz --num_episodes=3000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2
# visual-puzzle-4x6-noisy-v0
python generate_manipspace.py --env_name=visual-puzzle-4x6-v0 --save_path=data/visual-puzzle-4x6-noisy-v0.npz --num_episodes=5000 --max_episode_steps=1001 --dataset_type=noisy --p_random_action=0.2

# powderworld-easy-play-v0
python generate_powderworld.py --env_name=powderworld-easy-v0 --save_path=data/powderworld-easy-play-v0.npz --dataset_type=play --num_episodes=1000 --max_episode_steps=1001
# powderworld-medium-play-v0
python generate_powderworld.py --env_name=powderworld-medium-v0 --save_path=data/powderworld-medium-play-v0.npz --dataset_type=play --num_episodes=3000 --max_episode_steps=1001
# powderworld-hard-play-v0
python generate_powderworld.py --env_name=powderworld-hard-v0 --save_path=data/powderworld-hard-play-v0.npz --dataset_type=play --num_episodes=5000 --max_episode_steps=1001
