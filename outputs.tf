output "all-availability-domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}

output "compartment-name" {
  value = oci_identity_compartment.terraform_compartment.name
}

output "compartment-id" {
  value = oci_identity_compartment.terraform_compartment.id
}