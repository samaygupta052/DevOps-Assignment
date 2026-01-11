output "cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "backend_task_arn" {
  value = aws_ecs_task_definition.backend.arn
}

output "frontend_task_arn" {
  value = aws_ecs_task_definition.frontend.arn
}

