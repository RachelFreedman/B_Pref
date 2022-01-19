for seed in 12345 23451 34512; do
  for force_teacher in 0 1; do
    python train_PEBBLE.py  env=quadruped_walk seed=$seed select_teacher=true force_teacher=$force_teacher agent.params.actor_lr=0.0001 agent.params.critic_lr=0.0001 gradient_update=1 activation=tanh num_unsup_steps=9000 num_train_steps=4e5 num_interact=1e4 max_feedback=1e9 reward_batch=200 reward_update=50 feed_type=1 teacher_beta=[-1,-1] teacher_gamma=[1,1] teacher_eps_mistake=[0,0] teacher_eps_skip=0 teacher_eps_equal=0 num_teachers=2 UCB_confidence=10
  done
done