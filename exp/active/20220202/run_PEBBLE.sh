for seed in 12345 23451 34512 45123 51234; do
  for active in true false; do
      python train_PEBBLE.py  env=quadruped_walk seed=$seed agent.params.actor_lr=0.0001 agent.params.critic_lr=0.0001 gradient_update=1 activation=tanh num_unsup_steps=9000 num_train_steps=1000000 num_interact=30000 max_feedback=3000 reward_batch=100 reward_update=50 feed_type=1 teacher_beta=[-1,0.01] teacher_gamma=[1,1] teacher_eps_mistake=[0,0] teacher_query_cost=[-1,-1] teacher_eps_skip=0 teacher_eps_equal=0 select_teacher=$active UCB_confidence=1000 num_teachers=2
  done
done