variable "aws_region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "devops-assignment"
}

variable "backend_image" {
  description = "Backend Docker image (ECR)"
}

variable "frontend_image" {
  description = "Frontend Docker image (ECR)"
}

