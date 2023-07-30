variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "rds_password" {
  type        = string
  description = "Password to setup in RDS"
}