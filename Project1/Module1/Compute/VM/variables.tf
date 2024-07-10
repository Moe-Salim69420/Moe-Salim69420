variable "machine_type" {
    default = "e2-micro"
    type = string
    description = "the type of the machine"
}
variable "project" {
    default = "terraform-gcp-428122"
}

variable "image" {
    default = "ubuntu-os-cloud/ubuntu-2004-lts"
    type = string
}
variable "instance_name" {
    default = "myinstance"
    type = string
}
variable "region" {
    type = string
    default = "us-central1"
}
variable "zone" {
    default = "us-central1-a"
}
variable "number_of_instances" {
    type = number
    default = 2
}