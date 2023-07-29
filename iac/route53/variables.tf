variable "record_name" {
  description = "The name of the Route53 record."
}

variable "zone_id_route" {
  description = "The id of route53."
}

variable "elb_name" {
  description = "The name of the Elastic Load Balancer."
}

variable "zone_id_elb" {
  description = "The id of the Elastic Load Balancer."
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}