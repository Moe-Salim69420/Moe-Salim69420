# Vms 
variable "Default_VM_Parameters" {
    type = object({
      name = string
      machine_type = string
      project = string
      image = string
      region = string
      zone = string
      number_of_instances = number 
    })
    default = {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      machine_type = "e2-micro"
      name = "myinstance"
      number_of_instances = 1
      project = "terraform-gcp-428122"
      region = "us-central1"
      zone = "us-central1-a"
    }
}
