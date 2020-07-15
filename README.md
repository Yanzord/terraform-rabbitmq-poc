# Provision RabbitMQ with Terraform locally

This is a Terraform POC to provision RabbitMQ locally.

## Requirements

To run this POC you will need some software installed:

- [Docker](https://docs.docker.com/engine/install/ubuntu/);
- [Terraform](https://www.terraform.io/downloads.html);
- [Dep](https://golang.github.io/dep/docs/installation.html);

## Execution

The project contains two modules to provision a rabbitmq server: docker module and rabbitmq module.

- The docker module builds a rabbitmq-management-server image and run its container.
- The rabbitmq module creates a virtual host, gives full permission to the guest user and creates the 'bmf-queue' in the rabbitmq-server.

Navigate to the project root folder in your terminal.

- To initialize a working directory containing Terraform configuration files run:

      terraform init

- To create a execution plan and determine what actions are necessary to achieve the desired state specified in the configuration file run:

      terraform plan

- To apply the changes required to reach the desired state of the configuration, run in this order:

      terraform apply -target=module.docker -var-file="terraform.tfvars"
      terraform apply -target=module.rabbitmq -var-file="terraform.tfvars"

- To destroy the Terraform-managed infrastructure, run in this order:

      terraform destroy -target=module.rabbitmq
      terraform destroy -targe=module.docker

## Tests

- Navigate to the _tests_ folder in your terminal;

- To create _Gopkg.toml_, _Gopkg.lock_, and an empty _vendors_ folder:

      dep init

- To download go dependencies to the vendor folder:

      dep ensure

- To test all files (-v flag shows all the log output):

      go test -v

- To test a specific file:

      go test -v -run TestFunctionName