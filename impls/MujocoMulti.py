from functools import partial
# import gym
# from gym.spaces import Box
# from gym.wrappers import TimeLimit
import numpy as np
import copy
# from .multiagentenv import MultiAgentEnv
# from .manyagent_swimmer import ManyAgentSwimmerEnv
import json
def batch_partition(batch,agent_conf,scenario):
    # print("batch",batch)
    # batch_size,state_dim=batch["observations"].shape
    # _,action_dim=batch["actions"].shape
    if scenario in ["manyagent_ant"]:
        obs_labels = ["root", "root", "root", "root", "root", "root", "root",
                    "hip_1", "ankle_1",
                    "hip_2", "ankle_2",
                    "hip_3", "ankle_3", 
                    "hip_4", "ankle_4", 
                    "root", "root", "root", "root", "root", "root", 
                    "hip_1", "ankle_1", 
                    "hip_2", "ankle_2", 
                    "hip_3", "ankle_3", 
                    "hip_4", "ankle_4"]

        # qpos (15 维)
        # 0: torso 全局位置 x
        # 1: torso 全局位置 y
        # 2: torso 全局位置 z
        # 3: torso 四元数 w
        # 4: torso 四元数 x
        # 5: torso 四元数 y
        # 6: torso 四元数 z
        # 7: 前左腿 hip 关节角度
        # 8: 前左腿 ankle 关节角度
        # 9: 前右腿 hip 关节角度
        # 10: 前右腿 ankle 关节角度
        # 11: 后腿（back_leg） hip 关节角度
        # 12: 后腿（back_leg） ankle 关节角度
        # 13: 右后腿 hip 关节角度
        # 14: 右后腿 ankle 关节角度

        # qvel (14 维)
        # 15: torso 线速度 x 分量
        # 16: torso 线速度 y 分量
        # 17: torso 线速度 z 分量
        # 18: torso 角速度 x 分量
        # 19: torso 角速度 y 分量
        # 20: torso 角速度 z 分量
        # 21: 前左腿 hip 角速度
        # 22: 前左腿 ankle 角速度
        # 23: 前右腿 hip 角速度
        # 24: 前右腿 ankle 角速度
        # 25: 后腿 hip 角速度
        # 26: 后腿 ankle 角速度
        # 27: 右后腿 hip 角速度
        # 28: 右后腿 ankle 角速度

        action_labels = ["hip_4", "ankle_4", 
                         "hip_1", "ankle_1",
                         "hip_2","ankle_2",
                         "hip_3", "ankle_3"]

        if agent_conf == "2x4": # neighbouring legs together
            n_agents=2
            # 创建 partition_batch
            partition_batch_total = {}
            # 关键修正：创建 batch 的深拷贝，防止修改影响原始 batch
            partition_batch = copy.deepcopy(batch)
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_2" in label for label in obs_labels])

            mask_ac0 = np.array(["_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_2" in label for label in action_labels])
            mask_obs_dict = {0: mask_obs0, 1: mask_obs1}
            mask_ac_dict = {0: mask_ac0, 1: mask_ac1}
            # 选择不包含 "_2", "_3", "_4" 的列
            for i in range(n_agents):
                mask_obs = mask_obs_dict[i]  # 获取对应的 mask
                mask_ac = mask_ac_dict[i]
                # print("i",i)
                for key, value in batch.items():
                    if key in ["actions"]:
                        # print("batch[action]",batch["actions"].shape)
                        partition_batch[key] = batch[key][:, ~mask_ac]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    elif key in ["terminals","valids","masks","rewards"]:
                        partition_batch[key] = batch[key]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    else:
                        partition_batch[key] = batch[key][:, ~mask_obs]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)    
                # 关键修正：存储 partition_batch 的深拷贝，防止递归嵌套
                partition_batch_total[i] = copy.deepcopy(partition_batch)
        elif agent_conf == "2x4d":
            n_agents=2
            # 创建 partition_batch
            partition_batch_total = {}
            # 关键修正：创建 batch 的深拷贝，防止修改影响原始 batch
            partition_batch = copy.deepcopy(batch)
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_4" in label for label in obs_labels])

            mask_ac0 = np.array(["_2" in label or "_3" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_4" in label for label in action_labels])
            mask_obs_dict = {0: mask_obs0, 1: mask_obs1}
            mask_ac_dict = {0: mask_ac0, 1: mask_ac1}
            # 选择不包含 "_2", "_3", "_4" 的列
            for i in range(n_agents):
                mask_obs = mask_obs_dict[i]  # 获取对应的 mask
                mask_ac = mask_ac_dict[i]
                # print("i",i)
                for key, value in batch.items():
                    if key in ["actions"]:
                        # print("batch[action]",batch["actions"].shape)
                        partition_batch[key] = batch[key][:, ~mask_ac]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    elif key in ["terminals","valids","masks","rewards"]:
                        partition_batch[key] = batch[key]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    else:
                        partition_batch[key] = batch[key][:, ~mask_obs]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)    
                # 关键修正：存储 partition_batch 的深拷贝，防止递归嵌套
                partition_batch_total[i] = copy.deepcopy(partition_batch)
        elif agent_conf == "4x2":
            n_agents=4
            # 创建 partition_batch
            partition_batch_total = {}
            # 关键修正：创建 batch 的深拷贝，防止修改影响原始 batch
            partition_batch = copy.deepcopy(batch)
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in obs_labels])
            mask_obs3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in obs_labels])

            mask_ac0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in action_labels])
            mask_ac3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in action_labels])

            mask_obs_dict = {0: mask_obs0, 1: mask_obs1, 2: mask_obs2, 3: mask_obs3}
            mask_ac_dict = {0: mask_ac0, 1: mask_ac1, 2: mask_ac2, 3: mask_ac3}
            # 选择不包含 "_2", "_3", "_4" 的列
            for i in range(n_agents):
                mask_obs = mask_obs_dict[i]  # 获取对应的 mask
                mask_ac = mask_ac_dict[i]
                # print("i",i)
                for key, value in batch.items():
                    if key in ["actions"]:
                        # print("batch[action]",batch["actions"].shape)
                        partition_batch[key] = batch[key][:, ~mask_ac]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    elif key in ["terminals","valids","masks","rewards"]:
                        partition_batch[key] = batch[key]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    else:
                        partition_batch[key] = batch[key][:, ~mask_obs]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)    
                # 关键修正：存储 partition_batch 的深拷贝，防止递归嵌套
                partition_batch_total[i] = copy.deepcopy(partition_batch)
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    elif scenario == "manyagent_humanoid":
        obs_labels = ["root","root",
                      
        "abdomen_y", "abdomen_z", "abdomen_x", 
        "right_hip_x", "right_hip_z", "right_hip_y", 
        "right_knee", "right_ankle_x", "right_ankle_y", #比旧版本多了"right_ankle_x", "right_ankle_y"
        "left_hip_x", "left_hip_z", "left_hip_y", 
        "left_knee", "left_ankle_x", "left_ankle_y", #比旧版本多了"left_ankle_x", "left_ankle_y"
        "right_shoulder1", "right_shoulder2", "right_elbow", 
        "left_shoulder1", "left_shoulder2", "left_elbow",

        "head_height",

        "left_hand_x","left_hand_y","left_hand_z",
        "left_foot_x","left_foot_y","left_foot_z",
        "right_hand_x","right_hand_y","right_hand_z",
        "right_foot_x","right_foot_y","right_foot_z",

        "torso_zx","torso_zy","torso_zz",

        "center_of_mass_velocity_x","center_of_mass_velocity_y","center_of_mass_velocity_z",

        "root","root","root",
        "root","root","root",

        "abdomen_y", "abdomen_z", "abdomen_x", 
        "right_hip_x", "right_hip_z", "right_hip_y", 
        "right_knee", "right_ankle_x", "right_ankle_y", #比旧版本多了"right_ankle_x", "right_ankle_y"
        "left_hip_x", "left_hip_z", "left_hip_y", 
        "left_knee", "left_ankle_x", "left_ankle_y", #比旧版本多了"left_ankle_x", "left_ankle_y"
        "right_shoulder1", "right_shoulder2", "right_elbow", 
        "left_shoulder1", "left_shoulder2", "left_elbow"
        ]
        action_labels = [
        "abdomen_y", "abdomen_z", "abdomen_x", 
        "right_hip_x", "right_hip_z", "right_hip_y", 
        "right_knee", "right_ankle_x", "right_ankle_y", #比旧版本多了"right_ankle_x", "right_ankle_y"
        "left_hip_x", "left_hip_z", "left_hip_y", 
        "left_knee", "left_ankle_x", "left_ankle_y", #比旧版本多了"left_ankle_x", "left_ankle_y"
        "right_shoulder1", "right_shoulder2", "right_elbow", 
        "left_shoulder1", "left_shoulder2", "left_elbow"]
    
        if agent_conf == "9|12":#比原来多了脚踝关节的自由度，与mamujoco不同的地方
            n_agents=2
            # 创建 partition_batch
            partition_batch_total = {}
            # 关键修正：创建 batch 的深拷贝，防止修改影响原始 batch
            partition_batch = copy.deepcopy(batch)
                
            # 需要删除的列索引
            #删掉下肢留上肢，上肢9个自由度
            mask_obs0 = np.array(["right_hip" in label or "right_knee" in label or "right_ankle" in label or "left_hip" in label or "left_knee" in label or "left_ankle" in label or "left_foot" in label or "right_foot" in label for label in obs_labels])
            #删掉上肢留下肢，下肢12个自由度
            mask_obs1 = np.array(["abdomen_y" in label or "abdomen_z" in label or "abdomen_x" in label or "right_shoulder" in label or "right_elbow" in label or "left_shoulder" in label or "left_elbow" in label or "left_hand" in label or "right_hand" in label for label in obs_labels])
            
            mask_ac0 = np.array(["right_hip" in label or "right_knee" in label or "right_ankle" in label or "left_hip" in label or "left_knee" in label or "left_ankle" in label for label in action_labels])
            mask_ac1 = np.array(["abdomen_y" in label or "abdomen_z" in label or "abdomen_x" in label or "right_shoulder" in label or "right_elbow" in label or "left_shoulder" in label or "left_elbow" in label for label in action_labels])
            
            mask_obs_dict = {0: mask_obs0, 1: mask_obs1}
            mask_ac_dict = {0: mask_ac0, 1: mask_ac1}
            # 选择不包含 "_2", "_3", "_4" 的列
            for i in range(n_agents):
                mask_obs = mask_obs_dict[i]  # 获取对应的 mask
                mask_ac = mask_ac_dict[i]
                # print("i",i)
                for key, value in batch.items():
                    if key in ["actions"]:
                        # print("batch[action]",batch["actions"].shape)
                        partition_batch[key] = batch[key][:, ~mask_ac]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    elif key in ["terminals","valids","masks","rewards"]:
                        partition_batch[key] = batch[key]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    else:
                        partition_batch[key] = batch[key][:, ~mask_obs]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)    
                # 关键修正：存储 partition_batch 的深拷贝，防止递归嵌套
                partition_batch_total[i] = copy.deepcopy(partition_batch)
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    elif scenario == "manyagent_antsoccer":
        #这是online的
        # obs_labels = ["root", "root", "root", "root", "root", 
        #               "hip_1", "ankle_1", 
        #               "hip_2", "ankle_2", 
        #               "hip_3", "ankle_3", 
        #               "hip_4", "ankle_4", 
        #               "ball_z",
        #               "ball_rot","ball_rot","ball_rot","ball_rot",
        #                "root", "root", "root", "root", "root", "root", 
        #                "hip_1", "ankle_1", 
        #                "hip_2", "ankle_2", 
        #                "hip_3", "ankle_3", 
        #                "hip_4", "ankle_4",
        #                "ball_vel","ball_vel","ball_vel","ball_vel","ball_vel","ball_vel",
        #                "ball_agent_relativepos_x","ball_agent_relativepos_y",
        #                "goal_ball_relativepos_x","goal_ball_relativepos_y"]

        obs_labels = ["root", "root", "root", "root", "root", "root", "root",
                    "hip_1", "ankle_1",
                    "hip_2", "ankle_2",
                    "hip_3", "ankle_3", 
                    "hip_4", "ankle_4", 
                    "ball_x","ball_y","ball_z","ball_rot","ball_rot","ball_rot","ball_rot",

                    "root", "root", "root", "root", "root", "root", 
                    "hip_1", "ankle_1", 
                    "hip_2", "ankle_2", 
                    "hip_3", "ankle_3", 
                    "hip_4", "ankle_4",
                    "ball_vel","ball_vel","ball_vel","ball_vel","ball_vel","ball_vel"]

        action_labels = ["hip_4", "ankle_4", "hip_1", "ankle_1","hip_2","ankle_2","hip_3", "ankle_3"]

        if agent_conf == "2x4": # neighbouring legs together
            n_agents=2
            # 创建 partition_batch
            partition_batch_total = {}
            # 关键修正：创建 batch 的深拷贝，防止修改影响原始 batch
            partition_batch = copy.deepcopy(batch)
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_2" in label for label in obs_labels])

            mask_ac0 = np.array(["_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_2" in label for label in action_labels])
            mask_obs_dict = {0: mask_obs0, 1: mask_obs1}
            mask_ac_dict = {0: mask_ac0, 1: mask_ac1}
            # 选择不包含 "_2", "_3", "_4" 的列
            for i in range(n_agents):
                mask_obs = mask_obs_dict[i]  # 获取对应的 mask
                mask_ac = mask_ac_dict[i]
                # print("i",i)
                for key, value in batch.items():
                    if key in ["actions"]:
                        # print("batch[action]",batch["actions"].shape)
                        partition_batch[key] = batch[key][:, ~mask_ac]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    elif key in ["terminals","valids","masks","rewards"]:
                        partition_batch[key] = batch[key]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    else:
                        partition_batch[key] = batch[key][:, ~mask_obs]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)    
                # 关键修正：存储 partition_batch 的深拷贝，防止递归嵌套
                partition_batch_total[i] = copy.deepcopy(partition_batch)
        elif agent_conf == "2x4d":
            n_agents=2
            # 创建 partition_batch
            partition_batch_total = {}
            # 关键修正：创建 batch 的深拷贝，防止修改影响原始 batch
            partition_batch = copy.deepcopy(batch)
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_4" in label for label in obs_labels])

            mask_ac0 = np.array(["_2" in label or "_3" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_4" in label for label in action_labels])
            mask_obs_dict = {0: mask_obs0, 1: mask_obs1}
            mask_ac_dict = {0: mask_ac0, 1: mask_ac1}
            # 选择不包含 "_2", "_3", "_4" 的列
            for i in range(n_agents):
                mask_obs = mask_obs_dict[i]  # 获取对应的 mask
                mask_ac = mask_ac_dict[i]
                # print("i",i)
                for key, value in batch.items():
                    if key in ["actions"]:
                        # print("batch[action]",batch["actions"].shape)
                        partition_batch[key] = batch[key][:, ~mask_ac]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    elif key in ["terminals","valids","masks","rewards"]:
                        partition_batch[key] = batch[key]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    else:
                        partition_batch[key] = batch[key][:, ~mask_obs]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)    
                # 关键修正：存储 partition_batch 的深拷贝，防止递归嵌套
                partition_batch_total[i] = copy.deepcopy(partition_batch)
        elif agent_conf == "4x2":
            n_agents=4
            # 创建 partition_batch
            partition_batch_total = {}
            # 关键修正：创建 batch 的深拷贝，防止修改影响原始 batch
            partition_batch = copy.deepcopy(batch)
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in obs_labels])
            mask_obs3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in obs_labels])

            mask_ac0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in action_labels])
            mask_ac3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in action_labels])

            mask_obs_dict = {0: mask_obs0, 1: mask_obs1, 2: mask_obs2, 3: mask_obs3}
            mask_ac_dict = {0: mask_ac0, 1: mask_ac1, 2: mask_ac2, 3: mask_ac3}
            # 选择不包含 "_2", "_3", "_4" 的列
            for i in range(n_agents):
                mask_obs = mask_obs_dict[i]  # 获取对应的 mask
                mask_ac = mask_ac_dict[i]
                # print("i",i)
                for key, value in batch.items():
                    if key in ["actions"]:
                        # print("batch[action]",batch["actions"].shape)
                        partition_batch[key] = batch[key][:, ~mask_ac]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    elif key in ["terminals","valids","masks","rewards"]:
                        partition_batch[key] = batch[key]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)
                    else:
                        partition_batch[key] = batch[key][:, ~mask_obs]
                        # print(f"partition[{key}].shape",partition_batch[key].shape)    
                # 关键修正：存储 partition_batch 的深拷贝，防止递归嵌套
                partition_batch_total[i] = copy.deepcopy(partition_batch)
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
            
    return partition_batch_total


def variable_partition(variable,agent_conf,scenario):
    partitions = []
   
    if scenario in ["manyagent_ant"]:
        obs_labels = ["root", "root", "root", "root", "root", "root", "root", 
                      "hip_1", "ankle_1", 
                      "hip_2", "ankle_2", 
                      "hip_3", "ankle_3", 
                      "hip_4", "ankle_4", 
                      "root", "root", "root", "root", "root", "root", 
                      "hip_1", "ankle_1", 
                      "hip_2", "ankle_2", 
                      "hip_3", "ankle_3", 
                      "hip_4", "ankle_4"]
        if agent_conf == "2x4": # neighbouring legs together
          
            #注意不可以直接赋值，赋值表示引用，要拷贝，这里数组只有一层可以浅拷贝
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_2" in label for label in obs_labels])

            variable_0= variable[~mask_obs0].copy()
            variable_1= variable[~mask_obs1].copy()
            partitions.append(variable_0)
            partitions.append(variable_1)
        elif  agent_conf == "2x4d":
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_4" in label for label in obs_labels])

            variable_0= variable[~mask_obs0].copy()
            variable_1= variable[~mask_obs1].copy()
            partitions.append(variable_0)
            partitions.append(variable_1)
        elif agent_conf == "4x2":
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in obs_labels])
            mask_obs3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in obs_labels])

            variable_0= variable[~mask_obs0].copy()
            variable_1= variable[~mask_obs1].copy()
            variable_2= variable[~mask_obs2].copy()
            variable_3= variable[~mask_obs3].copy()
            partitions.append(variable_0)
            partitions.append(variable_1)
            partitions.append(variable_2)
            partitions.append(variable_3)
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    elif scenario == "manyagent_humanoid":
        obs_labels = ["root","root",
                      
        "abdomen_y", "abdomen_z", "abdomen_x", 
        "right_hip_x", "right_hip_z", "right_hip_y", 
        "right_knee", "right_ankle_x", "right_ankle_y", #比旧版本多了"right_ankle_x", "right_ankle_y"
        "left_hip_x", "left_hip_z", "left_hip_y", 
        "left_knee", "left_ankle_x", "left_ankle_y", #比旧版本多了"left_ankle_x", "left_ankle_y"
        "right_shoulder1", "right_shoulder2", "right_elbow", 
        "left_shoulder1", "left_shoulder2", "left_elbow",

        "head_height",

        "left_hand_x","left_hand_y","left_hand_z",
        "left_foot_x","left_foot_y","left_foot_z",
        "right_hand_x","right_hand_y","right_hand_z",
        "right_foot_x","right_foot_y","right_foot_z",

        "torso_zx","torso_zy","torso_zz",

        "center_of_mass_velocity_x","center_of_mass_velocity_y","center_of_mass_velocity_z",

        "root","root","root",
        "root","root","root",

        "abdomen_y", "abdomen_z", "abdomen_x", 
        "right_hip_x", "right_hip_z", "right_hip_y", 
        "right_knee", "right_ankle_x", "right_ankle_y", #比旧版本多了"right_ankle_x", "right_ankle_y"
        "left_hip_x", "left_hip_z", "left_hip_y", 
        "left_knee", "left_ankle_x", "left_ankle_y", #比旧版本多了"left_ankle_x", "left_ankle_y"
        "right_shoulder1", "right_shoulder2", "right_elbow", 
        "left_shoulder1", "left_shoulder2", "left_elbow"
        ]
        if agent_conf == "9|12": # neighbouring legs together
            # n_agents=2
            #注意不可以直接赋值，赋值表示引用，要拷贝，这里数组只有一层可以浅拷贝
                
            # 需要删除的列索引
            #删掉下肢留上肢，上肢9个自由度
            mask_obs0 = np.array(["right_hip" in label or "right_knee" in label or "right_ankle" in label or "left_hip" in label or "left_knee" in label or "left_ankle" in label or "left_foot" in label or "right_foot" in label for label in obs_labels])
            #删掉上肢留下肢，下肢12个自由度
            mask_obs1 = np.array(["abdomen_y" in label or "abdomen_z" in label or "abdomen_x" in label or "right_shoulder" in label or "right_elbow" in label or "left_shoulder" in label or "left_elbow" in label or "left_hand" in label or "right_hand" in label for label in obs_labels])

            variable_0= variable[~mask_obs0].copy()
            variable_1= variable[~mask_obs1].copy()
            partitions.append(variable_0)
            partitions.append(variable_1)
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    elif scenario == "manyagent_antsoccer":
        # obs_labels = ["root", "root", "root", "root", "root", "hip_1", "ankle_1", "hip_2", "ankle_2", "hip_3", "ankle_3", "hip_4", "ankle_4", "ball_z","ball_rot","ball_rot","ball_rot","ball_rot",
        #                "root", "root", "root", "root", "root", "root", "hip_1", "ankle_1", "hip_2", "ankle_2", "hip_3", "ankle_3", "hip_4", "ankle_4","ball_vel","ball_vel","ball_vel","ball_vel","ball_vel","ball_vel",
        #                "ball_agent_relativepos_x","ball_agent_relativepos_y",
        #                "goal_ball_relativepos_x","goal_ball_relativepos_y"]
        obs_labels = ["root", "root", "root", "root", "root", "root", "root",
                    "hip_1", "ankle_1",
                    "hip_2", "ankle_2",
                    "hip_3", "ankle_3", 
                    "hip_4", "ankle_4", 
                    "ball_x","ball_y","ball_z","ball_rot","ball_rot","ball_rot","ball_rot",

                    "root", "root", "root", "root", "root", "root", 
                    "hip_1", "ankle_1", 
                    "hip_2", "ankle_2", 
                    "hip_3", "ankle_3", 
                    "hip_4", "ankle_4",
                    "ball_vel","ball_vel","ball_vel","ball_vel","ball_vel","ball_vel"]
        if agent_conf == "2x4": # neighbouring legs together
          
            #注意不可以直接赋值，赋值表示引用，要拷贝，这里数组只有一层可以浅拷贝
                
            # 需要删除的列索引
            mask_obs0 = np.array(["_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_2" in label for label in obs_labels])

            variable_0= variable[~mask_obs0].copy()
            variable_1= variable[~mask_obs1].copy()
            partitions.append(variable_0)
            partitions.append(variable_1)
        elif  agent_conf == "2x4d":
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_4" in label for label in obs_labels])

            variable_0= variable[~mask_obs0].copy()
            variable_1= variable[~mask_obs1].copy()
            partitions.append(variable_0)
            partitions.append(variable_1)
        elif agent_conf == "4x2":
            # 需要删除的列索引
            mask_obs0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in obs_labels])
            mask_obs2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in obs_labels])
            mask_obs3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in obs_labels])

            variable_0= variable[~mask_obs0].copy()
            variable_1= variable[~mask_obs1].copy()
            variable_2= variable[~mask_obs2].copy()
            variable_3= variable[~mask_obs3].copy()
            partitions.append(variable_0)
            partitions.append(variable_1)
            partitions.append(variable_2)
            partitions.append(variable_3)
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    return partitions

def variable_combination(variable_part, agent_conf, scenario):
    if scenario in ["manyagent_ant"]:
        action_labels = ["hip_4", "ankle_4", 
                         "hip_1", "ankle_1",
                         "hip_2","ankle_2",
                         "hip_3", "ankle_3"]
        if agent_conf == "2x4":
            
            # 重新创建 mask
            mask_ac0 = np.array(["_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_2" in label for label in action_labels])
            
            
            # 创建一个空数组来存储合并后的数据
            variable = np.zeros((len(action_labels),), dtype=variable_part[0].dtype)
            
            # 还原数据
            variable[~mask_ac0] = variable_part[0]
            variable[~mask_ac1] = variable_part[1]
        elif agent_conf == "2x4d":
            # 重新创建 mask
            mask_ac0 = np.array(["_2" in label or "_3" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_4" in label for label in action_labels])
            
            
            # 创建一个空数组来存储合并后的数据
            variable = np.zeros((len(action_labels),), dtype=variable_part[0].dtype)
            
            # 还原数据
            variable[~mask_ac0] = variable_part[0]
            variable[~mask_ac1] = variable_part[1]
        elif agent_conf == "4x2":
            # 重新创建 mask
            mask_ac0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in action_labels])
            mask_ac3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in action_labels])
            
            # 创建一个空数组来存储合并后的数据
            variable = np.zeros((len(action_labels),), dtype=variable_part[0].dtype)
            
            # 还原数据
            variable[~mask_ac0] = variable_part[0]
            variable[~mask_ac1] = variable_part[1]
            variable[~mask_ac2] = variable_part[2]
            variable[~mask_ac3] = variable_part[3]
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    elif scenario == "manyagent_humanoid":
        action_labels = [
        "abdomen_y", "abdomen_z", "abdomen_x", 
        "right_hip_x", "right_hip_z", "right_hip_y", 
        "right_knee", "right_ankle_x", "right_ankle_y", #比旧版本多了"right_ankle_x", "right_ankle_y"
        "left_hip_x", "left_hip_z", "left_hip_y", 
        "left_knee", "left_ankle_x", "left_ankle_y", #比旧版本多了"left_ankle_x", "left_ankle_y"
        "right_shoulder1", "right_shoulder2", "right_elbow", 
        "left_shoulder1", "left_shoulder2", "left_elbow"]
        if agent_conf == "9|12": # neighbouring legs together
            mask_ac0 = np.array(["right_hip" in label or "right_knee" in label or "right_ankle" in label or "left_hip" in label or "left_knee" in label or "left_ankle" in label for label in action_labels])
            mask_ac1 = np.array(["abdomen_y" in label or "abdomen_z" in label or "abdomen_x" in label or "right_shoulder" in label or "right_elbow" in label or "left_shoulder" in label or "left_elbow" in label for label in action_labels])
            # 创建一个空数组来存储合并后的数据
            variable = np.zeros((len(action_labels),), dtype=variable_part[0].dtype)
            
            # 还原数据
            variable[~mask_ac0] = variable_part[0]
            variable[~mask_ac1] = variable_part[1]
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    elif scenario == "manyagent_antsoccer":
        action_labels = ["hip_4", "ankle_4", 
                         "hip_1", "ankle_1",
                         "hip_2","ankle_2",
                         "hip_3", "ankle_3"]
        if agent_conf == "2x4":
            
            # 重新创建 mask
            mask_ac0 = np.array(["_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_2" in label for label in action_labels])
            
            
            # 创建一个空数组来存储合并后的数据
            variable = np.zeros((len(action_labels),), dtype=variable_part[0].dtype)
            
            # 还原数据
            variable[~mask_ac0] = variable_part[0]
            variable[~mask_ac1] = variable_part[1]
        elif agent_conf == "2x4d":
            # 重新创建 mask
            mask_ac0 = np.array(["_2" in label or "_3" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_4" in label for label in action_labels])
            
            
            # 创建一个空数组来存储合并后的数据
            variable = np.zeros((len(action_labels),), dtype=variable_part[0].dtype)
            
            # 还原数据
            variable[~mask_ac0] = variable_part[0]
            variable[~mask_ac1] = variable_part[1]
        elif agent_conf == "4x2":
            # 重新创建 mask
            mask_ac0 = np.array(["_2" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac1 = np.array(["_1" in label or "_3" in label or "_4" in label for label in action_labels])
            mask_ac2 = np.array(["_1" in label or "_2" in label or "_4" in label for label in action_labels])
            mask_ac3 = np.array(["_1" in label or "_2" in label or "_3" in label for label in action_labels])
            
            # 创建一个空数组来存储合并后的数据
            variable = np.zeros((len(action_labels),), dtype=variable_part[0].dtype)
            
            # 还原数据
            variable[~mask_ac0] = variable_part[0]
            variable[~mask_ac1] = variable_part[1]
            variable[~mask_ac2] = variable_part[2]
            variable[~mask_ac3] = variable_part[3]
        else:
            raise Exception("UNKNOWN agent config: {}".format(agent_conf))
    return variable
    
    
