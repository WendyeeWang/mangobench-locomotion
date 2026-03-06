# antmaze-medium-navigate-v0 (GCBC)
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-medium-navigate-v0 (CRL)
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-medium-navigate-v0 (HIQL)
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2 
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2 
python main.py --env_name=antmaze-medium-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-large-navigate-v0 (GCBC)
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-large-navigate-v0 (CRL)
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-large-navigate-v0 (HIQL)
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2 
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2 
python main.py --env_name=antmaze-large-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-giant-navigate-v0 (GCBC)
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-giant-navigate-v0 (CRL)
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent.discount=0.995 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent.discount=0.995 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent.discount=0.995 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-giant-navigate-v0 (HIQL)
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.discount=0.995 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2 
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.discount=0.995 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2 
python main.py --env_name=antmaze-giant-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.discount=0.995 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-teleport-navigate-v0 (GCBC)
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-teleport-navigate-v0 (CRL)
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.1 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-teleport-navigate-v0 (HIQL)
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-medium-stitch-v0 (GCBC)
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-medium-stitch-v0 (CRL)
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-medium-stitch-v0 (HIQL)
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-large-stitch-v0 (GCBC)
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-large-stitch-v0 (CRL)
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-large-stitch-v0 (HIQL)
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-giant-stitch-v0 (GCBC)
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-giant-stitch-v0 (CRL)
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent.discount=0.995 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent.discount=0.995 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent.discount=0.995 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-giant-stitch-v0 (HIQL)
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.discount=0.995 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.discount=0.995 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-giant-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.discount=0.995 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-teleport-stitch-v0 (GCBC)
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-teleport-stitch-v0 (CRL)
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.1 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-teleport-stitch-v0 (HIQL)
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-medium-explore-v0 (GCBC)
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-medium-explore-v0 (CRL)
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-medium-explore-v0 (HIQL)
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-medium-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-large-explore-v0 (GCBC)
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-large-explore-v0 (CRL)
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-large-explore-v0 (HIQL)
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-large-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antmaze-teleport-explore-v0 (GCBC)
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-teleport-explore-v0 (CRL)
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.alpha=0.003 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4
# antmaze-teleport-explore-v0 (HIQL)
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=2x4 --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=2x4d --scenario=manyagent_ant --n_agents=2
python main.py --env_name=antmaze-teleport-explore-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=1.0 --agent.actor_p_trajgoal=0.0 --agent.high_alpha=10.0 --agent.low_alpha=10.0 --agent_conf=4x2 --scenario=manyagent_ant --n_agents=4

# antsoccer-arena-navigate-v0 (GCBC)
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-arena-navigate-v0 (CRL)
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.3 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.3 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.3 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-arena-navigate-v0 (HIQL)
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4

# antsoccer-medium-navigate-v0 (GCBC)
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-medium-navigate-v0 (CRL)
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.3 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.3 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/crl.py --agent.alpha=0.3 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-medium-navigate-v0 (HIQL)
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-navigate-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4

# antsoccer-arena-stitch-v0 (GCBC)
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-arena-stitch-v0 (CRL)
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.3 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.3 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.3 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-arena-stitch-v0 (HIQL)
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-arena-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4

# antsoccer-medium-stitch-v0 (GCBC)
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/gcbc.py --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-medium-stitch-v0 (CRL)
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.3 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.3 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/crl.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.alpha=0.3 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4
# antsoccer-medium-stitch-v0 (HIQL)
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4 --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=2x4d --scenario=manyagent_antsoccer --n_agents=2
python main.py --env_name=antsoccer-medium-stitch-v0 --eval_episodes=50 --agent=agents/hiql.py --agent.actor_p_randomgoal=0.5 --agent.actor_p_trajgoal=0.5 --agent.high_alpha=3.0 --agent.low_alpha=3.0 --agent_conf=4x2 --scenario=manyagent_antsoccer --n_agents=4

