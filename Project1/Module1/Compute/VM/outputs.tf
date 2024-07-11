output "instance_ids" {
  value = [for instance in google_compute_instance.VM : instance.self_link]
}
