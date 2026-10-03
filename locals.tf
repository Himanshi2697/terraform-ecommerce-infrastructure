locals {
  bucket_name    = "ecommerce-${var.environment}-product-assets-hima"
  current_region = data.aws_region.current.region
}
