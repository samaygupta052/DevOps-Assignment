variable "aws_region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "devops-assignment"
}

variable "backend_image" {
  description = "Backend ECR image URL"
}

variable "frontend_image" {
  description = "Frontend ECR image URL"
}

variable "aws_account_id" {}
variable "image_tag" {}

