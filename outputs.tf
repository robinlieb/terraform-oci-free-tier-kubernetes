output "all_availability_domains" {
  value       = module.compute.all_availability_domains
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

output "vcn_id" {
  value       = module.network.vcn.vcn_id
  description = "ID of the VCN."
}

output "vcn_id_route_id" {
  value       = module.network.vcn.ig_route_id
  description = "ID of the route."
}

output "vcn_nat_gateway_id" {
  value       = module.network.vcn.nat_gateway_id
  description = "ID of the NAT gateway."
}

output "vcn_nat_route_id" {
  value       = module.network.vcn.nat_route_id
  description = "ID of the NAT route."
}

output "available_images" {
  value       = module.compute.available_images
  description = "Available images."
}

output "public_ip_for_compute_instance" {
  value       = module.compute.instances[*].public_ip
  description = "Public IPs of the instances."
}

output "instance_name" {
  value       = module.compute.instances[*].display_name
  description = "Names of the instances."
}

output "instance_ocid" {
  value       = module.compute.instances[*].id
  description = "OCID of the instances."
}

output "instance_region" {
  value       = module.compute.instances[*].region
  description = "Region of the instances."
}

output "instance_shape" {
  value       = module.compute.instances[*].shape
  description = "Shape of the instances."
}

output "instance_state" {
  value       = module.compute.instances[*].state
  description = "State of the instances."
}

output "instance_OCPUs" {
  value       = module.compute.instances[*].shape_config[0].ocpus
  description = "CPUs of the instances."
}

output "instance_memory_in_GBs" {
  value       = module.compute.instances[*].shape_config[0].memory_in_gbs
  description = "Memory in GB of the instances."
}

output "time_created" {
  value       = module.compute.instances[*].time_created
  description = "Creation time of the instances"
}

output "kubeconfig" {
  value       = module.kubeconfig.kubeconfig
  description = "Kubeconfig to access the cluster"
  sensitive   = true
}

output "kubeconfig_commands" {
  value       = module.kubeconfig.kubeconfig_commands
  description = "Kubeconfig commands to apply to local kubeconfig"
  sensitive   = true
}

output "client_certificate" {
  value       = module.tls.client_pem
  description = "Kubernetes Client Certificate"
  sensitive   = true
}

output "client_key" {
  value       = module.tls.client_key
  description = "Kubernetes Client Key"
  sensitive   = true
}

output "cluster_ca_certificate" {
  value       = module.tls.ca_pem
  description = "Kubernetes Cluster CA Certificate"
  sensitive   = true
}
