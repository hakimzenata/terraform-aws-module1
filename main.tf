terraform {
  
}

provider "aws" {
  
}

resource "aws_s3_bucket" "R1" {
  for_each = toset(var.delta)
  bucket = each.value
}

data "aws_s3_bucket" "d1" {
  for_each = aws_s3_bucket.R1
  bucket = each.value.bucket
}