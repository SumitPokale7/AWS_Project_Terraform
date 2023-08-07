resource "aws_s3_bucket_website_configuration" "website-config" {
  bucket = aws_s3_bucket.test_buckets.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.jpeg"
  }

  # IF you want to use the routing rule

  # routing_rule {
  #   condition {
  #     key_prefix_equals = "/abc"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "xxx.jpeg"
  #   }
  # }

}