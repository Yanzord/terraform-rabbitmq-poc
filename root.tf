module "docker" {
	source = "./mod_docker"

	rabbitmq_version = var.RMQ_VERSION
	rabbitmq_user = var.RMQ_USR
	rabbitmq_password = var.RMQ_PSW
}

module "rabbitmq" {
	source = "./mod_rabbitmq"

	rabbitmq_user = var.RMQ_USR
	rabbitmq_password = var.RMQ_PSW
}