variable "mysql_root_password" {
  type        = string
  default     = "supersecret123"
  description = "Root password for MySQL database"
  sensitive   = true
}

variable "mysql_version" {
  type        = string
  default     = "5.7"
  description = "MySQL Docker image version"
}

variable "mysql_port" {
  type        = string
  default     = "3306"
  description = "Port for MySQL database"
}

variable "container_name" {
  type        = string
  default     = "tf-mysql"
  description = "Name for the MySQL container"
}

variable "network_name" {
  type        = string
  default     = "mydb_net"
  description = "Name for the Docker network"
}

variable "volume_name" {
  type        = string
  default     = "data"
  description = "Name for the docker volume"
}
