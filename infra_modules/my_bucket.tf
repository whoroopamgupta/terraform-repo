# S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  # arguments
  bucket = "${var.my-env}-my-devops-bucket-new"
  tags = {
    Name        = "${var.my-env}-MyDevOpsBucket"
    environment = var.my-env
  }
}
