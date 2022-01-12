import hydra
from reward_model import UCB
from train_PEBBLE import Workspace
from collections import deque

@hydra.main(config_path='config/test_PEBBLE.yaml', strict=True)
def main(cfg):
    workspace = Workspace(cfg)
    workspace.run()

import gym


def test():
    env = gym.make('FetchPush-v1')
    env.reset()
    for _ in range(1000):
        env.render()
        env.step(env.action_space.sample())  # take a random action

def hi():
    print("Hello World")

    avg_train_true_return = deque([], maxlen=10)

    for i in range(10):
        avg_train_true_return.append(i)

    print(avg_train_true_return)
    avg = sum(avg_train_true_return)/len(avg_train_true_return)
    print(avg)



def bandit():
    reward_seq = [1, 2, 3, 2, 1, 4, 2, 2, 2, 3]
    cost_seq = [-0.1, -0.2, -0.2, -0.1, -0.9, -0.8, -0.2, -0.1, -0.1, -0.2]
    confidence = 0.4

    bandit = UCB(2, confidence)

    for i in range(len(reward_seq)):
        arm = bandit.select()
        bandit.update(arm=arm, cost=cost_seq[i], reward=reward_seq[1])
        bandit.print_two_armed_bandit_state()

if __name__ == '__main__':
    main()
    # test()
    # hi()
    # bandit()