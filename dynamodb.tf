resource "aws_dynamodb_table" "name" {
  name         = var.dynamo_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id" # Primary key for the table
  attribute {
    name = "id"
    type = "S" # String type for the primary key
  }
}
