output "mysql_container_id" {
  value       = docker_container.mysql.id
  description = "description"
}

output "mysql_container_name" {
  value       = docker_container.mysql.name
  description = "Name of the MySQL container"
}

output "mysql_connection_string" {
  value       = "mysql://root:${var.mysql_root_password}@localhost:${var.mysql_port}"
  description = "MySQL connection string"
  sensitive   = true
}

output "mysql_network_name" {
  value       = docker_network.mysql_network.name
  description = "Name of the Docker network"
}

output "mysql_volume_name" {
  value       = docker_volume.mysql_data.name
  description = "Name of the Docker volume"
}

output "mysql_port" {
  value       = var.mysql_port
  description = "MySQL port"
}
