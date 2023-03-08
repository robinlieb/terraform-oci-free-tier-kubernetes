# Terraform Module for Kubernetes Cluster on OCI Cloud Free Tier

This project uses Terraform to create a Kubernetes cluster on the Oracle Cloud Infrastructure (OCI) Free Tier resources. The cluster consists of 4 nodes: one control plane and three worker nodes. Each node uses the Arm-based Ampere A1 core and 6 GM of memory.

Note: This project is not intended to be used in production environments.

## Prerequisites

Before running this project, you must have the following:

- An OCI account with Free Tier resources available
- Terraform installed on your local machine
- OCI CLI installed on your local machine
- SSH key pair generated on your local machine

## Example

To help get started quickly with this Terraform module, I have included an example configuration in the [example folder](examples). This example demonstrates how to use the module to provision a sample infrastructure that showcases its functionality.

<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | The fingerprint of the private\_key, e.g. 8c:bf:17:7b:5f:e0:7d:13:75:11:d6:39:0d:e2:84:74. | `string` | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | The private key retrieved from the Oracle account. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The desired region of the cluster, e.g. us-phoenix-1. | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | The private key used for SSH to the instances. | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | The public key used for SSH to the instances. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | The OCID of the tenany, e.g. ocid1.tenancy.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa. | `string` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | The OCID of the user, e.g. ocid1.user.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa. | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances which should be created. | `number` | `4` | no |
| <a name="input_instance_memory"></a> [instance\_memory](#input\_instance\_memory) | Amount of memory available to the instance, in gigabytes. | `number` | `6` | no |
| <a name="input_instance_ocpus"></a> [instance\_ocpus](#input\_instance\_ocpus) | Number of OCPUs available to the instance. | `number` | `1` | no |
| <a name="input_instance_os"></a> [instance\_os](#input\_instance\_os) | Operating system for compute instances. | `string` | `"Canonical Ubuntu"` | no |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Shape of the instances. | `string` | `"VM.Standard.A1.Flex"` | no |
| <a name="input_linux_os_version"></a> [linux\_os\_version](#input\_linux\_os\_version) | Operating system version for all Linux instances. | `string` | `"22.04"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name will be used for compartment and kubeconfig. | `string` | `"terraform-oci-free-tier-kubernetes"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_availability_domains"></a> [all\_availability\_domains](#output\_all\_availability\_domains) | All availaility domains. |
| <a name="output_available_images"></a> [available\_images](#output\_available\_images) | Available images. |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Kubernetes Client Certificate |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Kubernetes Client Key |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Kubernetes Cluster CA Certificate |
| <a name="output_compartment_id"></a> [compartment\_id](#output\_compartment\_id) | ID of the compartment. |
| <a name="output_compartment_name"></a> [compartment\_name](#output\_compartment\_name) | Name of the compartment. |
| <a name="output_instance_OCPUs"></a> [instance\_OCPUs](#output\_instance\_OCPUs) | CPUs of the instances. |
| <a name="output_instance_memory_in_GBs"></a> [instance\_memory\_in\_GBs](#output\_instance\_memory\_in\_GBs) | Memory in GB of the instances. |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | Names of the instances. |
| <a name="output_instance_ocid"></a> [instance\_ocid](#output\_instance\_ocid) | OCID of the instances. |
| <a name="output_instance_region"></a> [instance\_region](#output\_instance\_region) | Region of the instances. |
| <a name="output_instance_shape"></a> [instance\_shape](#output\_instance\_shape) | Shape of the instances. |
| <a name="output_instance_state"></a> [instance\_state](#output\_instance\_state) | State of the instances. |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | Kubeconfig to access the cluster |
| <a name="output_kubeconfig_commands"></a> [kubeconfig\_commands](#output\_kubeconfig\_commands) | Kubeconfig commands to apply to local kubeconfig |
| <a name="output_public_ip_for_compute_instance"></a> [public\_ip\_for\_compute\_instance](#output\_public\_ip\_for\_compute\_instance) | Public IPs of the instances. |
| <a name="output_time_created"></a> [time\_created](#output\_time\_created) | Creation time of the instances |
| <a name="output_vcn_id_route_id"></a> [vcn\_id\_route\_id](#output\_vcn\_id\_route\_id) | ID of the route. |
| <a name="output_vcn_nat_gateway_id"></a> [vcn\_nat\_gateway\_id](#output\_vcn\_nat\_gateway\_id) | ID of the NAT gateway. |
| <a name="output_vcn_nat_route_id"></a> [vcn\_nat\_route\_id](#output\_vcn\_nat\_route\_id) | ID of the NAT route. |
| <a name="output_vcp_id"></a> [vcp\_id](#output\_vcp\_id) | ID of the VCN. |
<!-- END_TF_DOCS -->

## License

This project is released under the Apache License 2.0. For more information, see the [LICENSE](LICENSE) file.