for seed in 12345 23451 34512; do
  for num_teachers in 1 2; do
      if [ $num_teachers = 1 ]; then
          echo "Running with 1 teacher."
          python train_PEBBLE.py  env=quadruped_walk seed=$seed select_teacher=true agent.params.actor_lr=0.0001 agent.params.critic_lr=0.0001 gradient_update=1 activation=tanh num_unsup_steps=9000 num_train_steps=1e6 num_interact=1e4 max_feedback=1e9 reward_batch=200 reward_update=50 feed_type=1 teacher_beta=[-1] teacher_gamma=[1] teacher_eps_mistake=[0] teacher_eps_skip=0 teacher_eps_equal=0 num_teachers=1 UCB_confidence=10
      fi
      if [ $num_teachers = 2 ]; then
          echo "Running with 2 teachers."
          python train_PEBBLE.py  env=quadruped_walk seed=$seed select_teacher=true agent.params.actor_lr=0.0001 agent.params.critic_lr=0.0001 gradient_update=1 activation=tanh num_unsup_steps=9000 num_train_steps=1e6 num_interact=1e4 max_feedback=1e9 reward_batch=200 reward_update=50 feed_type=1 teacher_beta=[-1,-1] teacher_gamma=[1,1] teacher_eps_mistake=[0,0] teacher_eps_skip=0 teacher_eps_equal=0 num_teachers=2 UCB_confidence=10
      fi
  done
done