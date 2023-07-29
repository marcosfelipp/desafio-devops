variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_account_id" {
  type        = string
  description = "ID of AWS account to allow in kubernetes"
}