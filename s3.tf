resource "aws_s3_bucket" "my_bucket" {
  # arguments
  bucket = "my-first-bucket-name-aug25"
  tags = {
    Name = "MyFirstBucketAug25"
  }
}
