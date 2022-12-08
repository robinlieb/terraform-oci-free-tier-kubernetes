output "all_availability_domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}

output "compartment_name" {
  value = oci_identity_compartment.terraform_compartment.name
}

output "compartment_id" {
  value = oci_identity_compartment.terraform_compartment.id
}

output "vcp_id" {
  value = module.vcn.vcn_id
}

output "vcn_id_route_id" {
  value = module.vcn.ig_route_id
}

output "vcn_nat_gateway_id" {
  value = module.vcn.nat_gateway_id
}

output "vcn_nat_route_id" {
  value = module.vcn.nat_route_id
}

output "available_images" {
  value = data.oci_core_images.instance_images.images
}

output "public_ip_for_compute_instance" {
  value = oci_core_instance.ubuntu_instance[*].public_ip
}

output "instance_name" {
  value = oci_core_instance.ubuntu_instance[*].display_name
}

output "instance_ocid" {
  value = oci_core_instance.ubuntu_instance[*].id
}

output "instance_region" {
  value = oci_core_instance.ubuntu_instance[*].region
}

output "instance_shape" {
  value = oci_core_instance.ubuntu_instance[*].shape
}

output "instance_state" {
  value = oci_core_instance.ubuntu_instance[*].state
}

output "instance_OCPUs" {
  value = oci_core_instance.ubuntu_instance[*].shape_config[0].ocpus
}

output "instance_memory_in_GBs" {
  value = oci_core_instance.ubuntu_instance[*].shape_config[0].memory_in_gbs
}

output "time_created" {
  value = oci_core_instance.ubuntu_instance[*].time_created
}
