provider "google" {
  project     = "terraform-gcp-428122"
  credentials = file("/home/mohammad/Terraform_GCP/Project1/Credentials/Credentials.json")
  region      = var.region
  zone        = var.zone
}
variable "zone" {
  default = "us-central1-a"
}
variable "region" {
  default = "us-central1"
}
module "firstVM" {
  source = "./Module1/Compute/VM"
  instance_name = "myvm"
}
module "vpc" {
  source = "./Module1/Compute/VPC"
  vpc_name = "myvpc"
}
output "instance_id" {
  value = module.firstVM.instance_id
}