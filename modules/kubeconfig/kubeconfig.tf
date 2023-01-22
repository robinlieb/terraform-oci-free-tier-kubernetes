data "template_file" "kubeconfig_commands" {
  template = <<EOF
kubectl config set-cluster ${var.cluster_name} --server=${var.cluster_url}
kubectl config set clusters.${var.cluster_name}.certificate-authority-data ${base64encode(var.ca_file)}
kubectl config set users.${var.user_name}.client-certificate-data ${base64encode(var.client_cert_file)}
kubectl config set users.${var.user_name}.client-key-data ${base64encode(var.client_key_file)}
kubectl config set-context ${var.context_name} --cluster=${var.cluster_name} --user=${var.user_name}
kubectl config use-context ${var.context_name}
EOF
}

data "template_file" "kubeconfig" {
  template = <<EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${base64encode(var.ca_file)}
    server: ${var.cluster_url}
  name: ${var.cluster_name}
contexts:
- context:
    cluster: ${var.cluster_name}
    user: ${var.user_name}
  name: ${var.context_name}
current-context: ${var.context_name}
kind: Config
preferences: {}
users:
- name: ${var.user_name}
  user:
    client-certificate-data: ${base64encode(var.client_cert_file)}
    client-key-data: ${base64encode(var.client_key_file)}
EOF
}
