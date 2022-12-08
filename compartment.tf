resource "oci_identity_compartment" "terraform_compartment" {
  compartment_id = var.tenancy_ocid
  description    = "Compartment for Terraform resources."
  name           = "terraform"
}
