resource "oci_identity_compartmet" "terraform_compartment" {
    compartment_id = var.tenancy_ocid
    description = "Compartment for Terraform resources."
    name = "terraform"
}