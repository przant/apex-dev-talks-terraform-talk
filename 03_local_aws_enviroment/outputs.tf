output "local_endpoint" {
  value = "${var.aws_endpoint_hostname}:${var.aws_endpoint_port}"
}

output "localstack_container_name" {
  value = docker_container.localstack.name
}