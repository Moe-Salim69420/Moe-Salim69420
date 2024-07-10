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

resource "google_compute_instance" "instance1" {
  machine_type = "e2-small"
  name         = "terraform-vm"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
      //
    }
  }

}
resource "google_compute_instance_group" "loadbalancedVMs" {
  name        = "instance-group-1"
  zone        = var.zone
  description = "this is for load balancing an instance group"
  instances   = [google_compute_instance.instance1.self_link]
}
resource "google_compute_health_check" "health-Check" {
  name               = "http-helth-check"
  check_interval_sec = 10
  timeout_sec        = 5
  http_health_check {
    port         = 80
    request_path = "/"
  }
}

resource "google_compute_backend_service" "back-end-service" {
  name                            = "back-end-service"
  port_name                       = "http"
  project                         = "terraform-gcp-428122"
  timeout_sec                     = 30
  connection_draining_timeout_sec = 30
  backend {
    group = google_compute_instance_group.loadbalancedVMs.self_link
  }
  health_checks = [google_compute_health_check.health-Check.id]
}

resource "google_compute_url_map" "url_map" {
  name            = "url-map"
  default_service = google_compute_backend_service.back-end-service.self_link

}

resource "google_compute_target_http_proxy" "target-http-proxy" {
  name    = "target-http-proxy"
  url_map = google_compute_url_map.url_map.self_link

}
resource "google_compute_global_forwarding_rule" "name" {
  name       = "global-forwarding-rule"
  target     = google_compute_target_http_proxy.target-http-proxy.self_link
  port_range = "80"


}