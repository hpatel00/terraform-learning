resource "aws_route53_record" "component" {
  zone_id = "Z0150156UD0J2BIEAJM9"
  name    = "${var.COMPONENT}-dev.roboshop.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_spot_instance_request.cheap_worker.public_ip]
}