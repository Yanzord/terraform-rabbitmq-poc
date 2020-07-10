# Provision RabbitMQ with Terraform locally

This is a Terraform POC to provision RabbitMQ locally.

## Requirements

To run this POC you will need some software installed:

- [Docker](https://docs.docker.com/engine/install/ubuntu/);
- [Terraform](https://www.terraform.io/downloads.html);

## Execution

The project contains two modules to provision a rabbitmq server: docker module and rabbitmq module.

- The docker module builds a rabbitmq-management-server image and run its container.
- The rabbitmq module creates a virtual host, gives full permission to the guest user and creates the 'bmf-queue' in the rabbitmq-server.

Navigate to the project root folder in your terminal.

- To initialize a working directory containing Terraform configuration files, type:

      terraform init

- To create a execution plan and determine what actions are necessary to achieve the desired state specified in the configuration files, type:

      terraform plan

- To apply the changes required to reach the desired state of the configuration, type in this order:

      terraform apply -target=module.docker -var-file="terraform.tfvars"
      terraform apply -target=module.rabbitmq -var-file="terraform.tfvars"

- To destroy the Terraform-managed infrastructure, type in this order:

      terraform destroy -target=module.rabbitmq
      terraform destroy -targe=module.docker