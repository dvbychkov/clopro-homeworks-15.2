output "public_vm_external_ip" {
  value = yandex_compute_instance.public_vm.network_interface.0.nat_ip_address
}

output "public_vm_internal_ip" {
  value = yandex_compute_instance.public_vm.network_interface.0.ip_address
}

output "private_vm_internal_ip" {
  value = yandex_compute_instance.private_vm.network_interface.0.ip_address
}

output "nat_instance_external_ip" {
  value = yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address
}

output "nat_instance_internal_ip" {
  value = yandex_compute_instance.nat_instance.network_interface.0.ip_address
}

# Outputs для Object Storage
output "bucket_name" {
  description = "Name of the created storage bucket"
  value       = yandex_storage_bucket.my_bucket.id
}

output "bucket_domain_name" {
  description = "Domain name of the storage bucket"
  value       = yandex_storage_bucket.my_bucket.bucket_domain_name
}

output "picture_url" {
  description = "Public URL of the uploaded picture"
  value       = "https://storage.yandexcloud.net/${yandex_storage_bucket.my_bucket.id}/${yandex_storage_object.picture.key}"
}

# Outputs для Instance Group и Load Balancer
output "instance_group_id" {
  description = "ID of the instance group"
  value       = yandex_compute_instance_group.lamp_group.id
}

output "load_balancer_ip" {
  description = "External IP of the load balancer"
  value       = [for listener in yandex_lb_network_load_balancer.lamp_lb.listener : [for addr in listener.external_address_spec : addr.address][0]][0]
}

output "load_balancer_url" {
  description = "URL of the load balancer"
  value       = "http://${[for listener in yandex_lb_network_load_balancer.lamp_lb.listener : [for addr in listener.external_address_spec : addr.address][0]][0]}"
}
