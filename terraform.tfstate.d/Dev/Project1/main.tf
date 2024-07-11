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
variable "default_vm_parameters" {
  type = object({
    name                = string
    machine_type        = string
    project             = string
    image               = string
    region              = string
    zone                = string
    number_of_instances = number
  })
  default = {
    name                = "default-vm"
    machine_type        = "e2-micro"
    project             = "terraform-gcp-428122"
    image               = "ubuntu-os-cloud/ubuntu-2004-lts"
    region              = "us-central1"
    zone                = "us-central1-a"
    number_of_instances = 1
  }
}
module "firstVM" {
  source = "./Module1/Compute/VM"
 Default_VM_Parameters = merge(
    var.default_vm_parameters,
    {
      name                = "vm-myvmy",
      number_of_instances = 2
      
    }
  )
}

module "secondVM" {
  source = "./Module1/Compute/VM"
  
}

output "instance_id1" {
  value = module.firstVM.instance_ids
}
output "instance_id2" {
  value = module.secondVM.instance_ids
}
