module "docker" {
	source = "./modules/docker"

	rabbitmq_user = var.rabbitmq_user
	rabbitmq_password = var.rabbitmq_password
}

module "rabbitmq" {
	source = "./modules/rabbitmq"

	rabbitmq_user = var.rabbitmq_user
	rabbitmq_password = var.rabbitmq_password
}