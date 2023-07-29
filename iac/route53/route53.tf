resource "aws_route53_record" "A" {
  name    = var.record_name
  type    = "A"
  zone_id = var.zone_id_route

  alias {
    evaluate_target_health = true
    name                   = var.elb_name
    zone_id                = var.zone_id_elb
  }
}