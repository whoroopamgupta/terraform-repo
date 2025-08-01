variable "dynamo_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "terraform-pr-table"
}


variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-08a6efd148b1f7504" # Example AMI ID, replace with your desired AMI
}
