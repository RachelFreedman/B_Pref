import hydra
from train_PEBBLE import Workspace
from collections import deque

@hydra.main(config_path='config/test_PEBBLE.yaml', strict=True)
def main(cfg):
    workspace = Workspace(cfg)
    workspace.run()

import gym
def test_gym():
    env = gym.make('FetchPush-v1')
    env.reset()
    for _ in range(1000):
        env.render()
        env.step(env.action_space.sample())  # take a random action


if __name__ == '__main__':
    main()
    # test_gym()