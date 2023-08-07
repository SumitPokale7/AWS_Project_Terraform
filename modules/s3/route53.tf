data "aws_s3_bucket" "test_buckets" {
  bucket = aws_s3_bucket.test_bucket.bucket
}

resource "aws_route53_zone" "main" {
  for_each = each.value.route53 == true ? [1] : []

  name = each.value.domain_name
  tags = {
    Name        = "www.${each.value.domain_name}"
    description = each.value.domain_name
  }
  comment = each.value.domain_name
}

resource "aws_route53_record" "www-a" {
  for_each = each.value.route53 == true ? [1] : []

  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${each.value.domain_name}"
  type    = "A"
  alias {
    name                   = data.aws_s3_bucket.test_bucket.website_domain
    zone_id                = data.aws_s3_bucket.test_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
