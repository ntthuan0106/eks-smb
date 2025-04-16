# data "aws_route53_zone" "route53_zone" {
#   name         = var.domain_name
#   private_zone = true
# }
# data "aws_route53_records" "route53_record" {
#   zone_id = data.aws_route53_zone.route53_zone.zone_id
# }
resource "aws_acm_certificate" "acm_pub_cert" {
  domain_name = var.domain_name
  validation_method = "DNS"
  key_algorithm = var.key_algorithm
}
