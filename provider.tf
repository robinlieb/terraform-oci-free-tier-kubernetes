provider "oci" {
    tenancy_ocid = vars.tenancy_ocid
    user_ocid = vars.user_ocid
    private_key = vars.private_key
    fingerprint = vars.fingerprint
    region = vars.region
}