output "all-availability-domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}

output "compartnemt-name" {
  value = oci_identity_compartment.terraform_compartment.name
}

output "compartnemt-id" {
  value = oci_identity_compartment.terraform_compartment.id
}