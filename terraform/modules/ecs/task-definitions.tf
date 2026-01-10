resource "aws_ecs_task_definition" "backend" {
  family                   = "backend"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([{
    name  = "backend"
    image = var.backend_image
    portMappings = [{
      containerPort = 8000
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group  = aws_cloudwatch_log_group.backend.name
        awslogs-region = var.aws_region
        awslogs-stream-prefix = "ecs"
      }
    }
  }])
}


resource "aws_ecs_task_definition" "frontend" {
  family                   = "frontend"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([{
    name  = "frontend"
    image = var.frontend_image
    portMappings = [{
      containerPort = 3000
    }]
    environment = [{
      name  = "NEXT_PUBLIC_API_URL"
      value = var.backend_url
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group  = aws_cloudwatch_log_group.frontend.name
        awslogs-region = var.aws_region
        awslogs-stream-prefix = "ecs"
      }
    }
  }])
}

