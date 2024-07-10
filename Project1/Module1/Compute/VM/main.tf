resource "google_compute_instance" "VM" {
    machine_type = var.machine_type
    name = var.instance_name
    zone = var.zone
    project = var.project
    boot_disk {
        initialize_params {
          image = var.image
        }
    }
    network_interface {
      network = "default"
      access_config {
       
      }
    }
    
}
