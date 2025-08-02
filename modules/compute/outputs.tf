output "all_availability_domains" {
  value       = data.oci_identity_availability_domains.ads.availability_domains
  description = "All availaility domains."
}

output "instances" {
  value = oci_core_instance.ubuntu_instance[*]
}

output "available_images" {
  value = data.oci_core_images.instance_images.images
}
