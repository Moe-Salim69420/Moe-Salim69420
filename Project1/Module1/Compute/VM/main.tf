resource "google_compute_instance" "VM" {
    machine_type = var.Default_VM_Parameters.machine_type
    count = var.Default_VM_Parameters.number_of_instances
    name = "${var.Default_VM_Parameters.name}-${count.index}"
    zone = var.Default_VM_Parameters.zone
    project = var.Default_VM_Parameters.project
    boot_disk {
      initialize_params {
        image = var.Default_VM_Parameters.image
      }
    }
    network_interface {
      network = "default"
      access_config {
       
      }
    }
    
}