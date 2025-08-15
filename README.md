# Terraform Examples Repository

This repository contains a collection of practical Terraform examples designed for learning and demonstrating Infrastructure as Code (IaC) concepts. Each example builds progressively in complexity, covering different aspects of Terraform functionality and real-world use cases.

## 🎯 Repository Goals

- Provide hands-on Terraform examples for learning purposes
- Demonstrate Infrastructure as Code principles
- Show integration between Terraform and containerization technologies
- Present practical scenarios for local development environments

## 📋 Prerequisites

Before running the examples in this repository, ensure you have the following tools installed:

### Required Software
- **Terraform** v1.12.2 or later
- **Docker** v28.3.3 or later (Community Edition)
- **Git** for version control

### Verified Environment
These examples have been tested with:
- Terraform v1.12.2 on Linux AMD64
- Docker Engine v28.3.3 (Community)
- containerd v1.7.27
- runc v1.2.5

## 📁 Examples Overview

### 1. File Archiving (`01_archiving_files/`)

**Purpose**: Demonstrates Terraform's file manipulation capabilities using the `archive` and `local` providers.

**What it does**:
- Creates directory structures automatically
- Archives selected files into a ZIP package
- Shows how to use `fileset()` and conditional file inclusion
- Demonstrates dependency management between resources

**Key Learning Points**:
- Working with Terraform's built-in functions
- File and directory manipulation
- Resource dependencies
- Variable usage and defaults

**Requirements**: Terraform only (no external dependencies)

### 2. MySQL Container Management (`02_mysql_container/`)

**Purpose**: Shows how to manage Docker containers using Terraform, focusing on database deployment.

**What it does**:
- Deploys a MySQL container with persistent storage
- Creates dedicated Docker network and volume
- Configures environment variables securely
- Implements health checks and restart policies
- Provides connection outputs for application integration

**Key Learning Points**:
- Docker provider usage in Terraform
- Container networking and storage
- Sensitive data handling
- Health monitoring
- Output values for service discovery

**Requirements**: 
- Terraform
- Docker

### 3. Local AWS Environment (`03_local_aws_enviroment/`)

**Purpose**: Sets up a local AWS development environment using LocalStack for testing AWS services without cloud costs.

**What it does**:
- Deploys LocalStack container for AWS service emulation
- Configures AWS provider to use local endpoints
- Sets up SQS, S3, and STS services locally
- Enables persistence for data across container restarts
- Provides networking configuration for service communication

**Key Learning Points**:
- AWS provider configuration
- LocalStack setup and configuration
- Multi-provider usage (Docker + AWS)
- Local development workflows
- Service endpoint configuration

**Requirements**:
- Terraform
- Docker

## 🚀 Getting Started

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd terraform-examples
   ```

2. **Choose an example directory**:
   ```bash
   cd 01_archiving_files  # or 02_mysql_container or 03_local_aws_enviroment
   ```

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Review the plan**:
   ```bash
   terraform plan
   ```

5. **Apply the configuration**:
   ```bash
   terraform apply
   ```

6. **Clean up resources**:
   ```bash
   terraform destroy
   ```

## 📚 Learning Path

These examples are designed to be followed in sequence:

1. **Start with File Archiving** - Learn basic Terraform concepts without external dependencies
2. **Progress to MySQL Container** - Understand infrastructure provisioning with Docker
3. **Advance to Local AWS Environment** - Master complex multi-provider scenarios

Each example includes comprehensive variable definitions and outputs to demonstrate Terraform best practices.

## 🛠️ Development Environment

This repository follows DevOps best practices:

- **Version Control**: Git with comprehensive `.gitignore`
- **Security**: Sensitive values marked appropriately
- **Documentation**: Each module is self-documented
- **Modularity**: Clean separation of concerns
- **Reusability**: Parameterized configurations

## 🔧 Troubleshooting

### Common Issues

1. **Docker Socket Permission**: Ensure your user has Docker permissions
   ```bash
   sudo usermod -aG docker $USER
   ```

2. **Port Conflicts**: Check if required ports (3306, 4566) are available
   ```bash
   netstat -tpln | grep :3306
   ```

3. **LocalStack Services**: Verify LocalStack container health
   ```bash
   docker logs <localstack-container-name>
   ```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

These examples are part of a developer talk and learning material. Feel free to use them as reference for your own Terraform learning journey.

---

**Note**: These examples are designed for educational purposes and local development. For production use, ensure proper security configurations, state management, and environment-specific adaptations.