[1mdiff --git a/main.tf b/main.tf[m
[1mindex 0dabb2a..ae492ce 100644[m
[1m--- a/main.tf[m
[1m+++ b/main.tf[m
[36m@@ -15,37 +15,10 @@[m [mprovider "aws" {[m
 [m
 # 3. Resource Configuration[m
 resource "aws_s3_bucket" "product_assets" {[m
[31m-  bucket = "${var.project_name}-${var.environment}-product-assets-arun-02"[m
[32m+[m[32m  bucket = local.bucket_name[m
 [m
   tags = {[m
     Environment = var.environment[m
     Purpose     = "product-assets"[m
   }[m
[31m-[m
[31m-}[m
[31m-# Resource Dependency[m
[31m-resource "aws_iam_policy" "product_assets_access" {[m
[31m-  name = "${var.project_name}-${var.environment}-product-assets-access"[m
[31m-[m
[31m-  policy = jsonencode({[m
[31m-    Version = "2012-10-17"[m
[31m-[m
[31m-    Statement = [[m
[31m-      {[m
[31m-        Effect = "Allow"[m
[31m-[m
[31m-        Action = [[m
[31m-          "s3:GetObject",[m
[31m-          "s3:PutObject"[m
[31m-        ][m
[31m-[m
[31m-        Resource = "${aws_s3_bucket.product_assets.arn}/*"[m
[31m-      }[m
[31m-    ][m
[31m-  })[m
[31m-[m
[31m-  tags = {[m
[31m-    Environment = var.environment[m
[31m-    Purpose     = "product-assets-access"[m
[31m-  }[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/variables.tf b/variables.tf[m
[1mindex 1ffde43..2b51708 100644[m
[1m--- a/variables.tf[m
[1m+++ b/variables.tf[m
[36m@@ -1,17 +1,16 @@[m
 variable "aws_region" {[m
[31m-  description = "AWS region where the infrastructure will be provisioned."[m
   type        = string[m
[32m+[m[32m  description = "AWS region"[m
   default     = "ap-south-1"[m
 }[m
 [m
 variable "environment" {[m
[31m-  description = "Deployment environment for the infrastructure."[m
   type        = string[m
[32m+[m[32m  description = "Deployment environment"[m
   default     = "dev"[m
[31m-}[m
 [m
[31m-variable "project_name" {[m
[31m-  description = "Name of the project."[m
[31m-  type        = string[m
[31m-     default     = "ecommerce"[m
[32m+[m[32m  validation {[m
[32m+[m[32m    condition     = contains(["dev", "qa", "prod"], var.environment)[m
[32m+[m[32m    error_message = "Environment must be one of: dev, qa, prod."[m
[32m+[m[32m  }[m
 }[m
\ No newline at end of file[m
