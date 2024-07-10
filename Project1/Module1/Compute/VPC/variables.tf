variable "vpc_name" {
  description = "Name of the VPC"
  default     = "my-vpc"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "subnet-1"
}
variable "region" {
    default = "us-central1"
}