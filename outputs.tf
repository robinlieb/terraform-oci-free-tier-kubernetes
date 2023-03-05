output "all_availability_domains" {
  value       = data.oci_identity_availability_domains.ads.availability_domains
  description = "All availaility domains."
}

output "compartment_name" {
  value       = oci_identity_compartment.terraform_compartment.name
  description = "Name of the compartment."
}

output "compartment_id" {
  value       = oci_identity_compartment.terraform_compartment.id
  description = "ID of the compartment."
}

output "vcp_id" {
  value       = module.vcn.vcn_id
  description = "ID of the VCN."
}

output "vcn_id_route_id" {
  value       = module.vcn.ig_route_id
  description = "ID of the route."
}

output "vcn_nat_gateway_id" {
  value       = module.vcn.nat_gateway_id
  description = "ID of the NAT gateway."
}

output "vcn_nat_route_id" {
  value       = module.vcn.nat_route_id
  description = "ID of the NAT route."
}

output "available_images" {
  value       = data.oci_core_images.instance_images.images
  description = "Available images."
}

output "public_ip_for_compute_instance" {
  value       = oci_core_instance.ubuntu_instance[*].public_ip
  description = "Public IPs of the instances."
}

output "instance_name" {
  value       = oci_core_instance.ubuntu_instance[*].display_name
  description = "Names of the instances."
}

output "instance_ocid" {
  value       = oci_core_instance.ubuntu_instance[*].id
  description = "OCID of the instances."
}

output "instance_region" {
  value       = oci_core_instance.ubuntu_instance[*].region
  description = "Region of the instances."
}

output "instance_shape" {
  value       = oci_core_instance.ubuntu_instance[*].shape
  description = "Shape of the instances."
}

output "instance_state" {
  value       = oci_core_instance.ubuntu_instance[*].state
  description = "State of the instances."
}

output "instance_OCPUs" {
  value       = oci_core_instance.ubuntu_instance[*].shape_config[0].ocpus
  description = "CPUs of the instances."
}

output "instance_memory_in_GBs" {
  value       = oci_core_instance.ubuntu_instance[*].shape_config[0].memory_in_gbs
  description = "Memory in GB of the instances."
}

output "time_created" {
  value       = oci_core_instance.ubuntu_instance[*].time_created
  description = "Creation time of the instances"
}

output "kubeconfig" {
  value       = module.kubeconfig.kubeconfig
  description = "Kubeconfig to access the cluster"
}

output "kubeconfig_commands" {
  value       = module.kubeconfig.kubeconfig_commands
  description = "Kubeconfig commands to apply to local kubeconfig"
}
