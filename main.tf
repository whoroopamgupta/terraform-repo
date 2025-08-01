module "dev-app" {
  source         = "./infra_modules"
  my-env         = "dev"
  instance_type  = "t2.micro"
  ami_id         = "ami-08a6efd148b1f7504"
  instance_count = 1
}

module "stg-app" {
  source         = "./infra_modules"
  my-env         = "stg"
  instance_type  = "t2.micro"
  ami_id         = "ami-08a6efd148b1f7504"
  instance_count = 2
}

module "prd-app" {
  source         = "./infra_modules"
  my-env         = "prd"
  instance_type  = "t2.micro"
  ami_id         = "ami-08a6efd148b1f7504"
  instance_count = 3
}
