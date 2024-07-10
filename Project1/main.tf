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
  source              = "./Module1/Compute/VM"
  instance_name       = "vm-set1"
  number_of_instances = 2
  machine_type        = "n1-standard-1"
  zone                = var.zone
}

module "secondVM" {
  source              = "./Module1/Compute/VM"
  instance_name       = "vm-set2"
  number_of_instances = 3
  machine_type        = "n1-highmem-2"
  zone                = var.zone
}

output "instance_ids" {
  value = module.firstVM.instance_ids
}
