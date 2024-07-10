resource "google_compute_instance" "VM" {
    machine_type = var.machine_type
    count = var.number_of_instances
    name = "${var.instance_name} - ${count.index}"
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
