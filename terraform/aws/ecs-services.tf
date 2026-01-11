resource "aws_ecs_service" "backend" {
 depends_on = [
    aws_lb_listener.http
  ]
  name            = "backend"
  cluster         = module.ecs.cluster_id
  task_definition = module.ecs.backend_task_arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
  subnets          = module.vpc.public_subnets
  assign_public_ip = true
  security_groups  = [aws_security_group.ecs.id]
}

  load_balancer {
    target_group_arn = aws_lb_target_group.backend.arn
    container_name   = "backend"
    container_port   = 8000
  }
}

