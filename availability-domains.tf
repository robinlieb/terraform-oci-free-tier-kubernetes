data "oci_identity_availability_domains" "ads" {
  compartment_id = vars.tenancy_ocid
}