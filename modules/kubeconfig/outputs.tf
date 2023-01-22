output "kubeconfig_commands" {
  value = data.template_file.kubeconfig_commands.rendered
}

output "kubeconfig" {
  value = data.template_file.kubeconfig.rendered
}
