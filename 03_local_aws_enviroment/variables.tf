variable "aws_region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-west-2"
}

variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
  default     = "test"
}

variable "aws_secret_key" {
  description = "The AWS access key"
  type        = string
  default     = "test"
}

variable "aws_endpoint_hostname" {
  description = "The AWS services hostname"
  type        = string
  default     = "http://localhost"
}

variable "aws_endpoint_port" {
  description = "The AWS port of the endpoint"
  type        = number
  default     = 4566
}

variable "docker_network_name" {
  description = "The Docker network name"
  type        = string
  default     = "localstack-network"
}

variable "docker_volume_name" {
  description = "The Docker volume name"
  type        = string
  default     = "localstack-volume"
}

variable "docker_container_name" {
  description = "The Docker container name"
  type        = string
  default     = "localstack-container"
}

variable "environment" {
  description = "The working environment name"
  type        = string
  default     = "testing"
}

variable "localstack_data_dir" {
  description = "The LocalStack container data dir path"
  type        = string
  default     = "/var/lib/localstack"
}