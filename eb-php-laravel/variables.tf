variable "key_name" {
  description = "Name of the SSH keypair to use in AWS.https://cloudonaut.io/avoid-sharing-key-pairs-for-ec2/"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-2"
}

variable "aws_profile" {
  description = "AWS profile name in .aws/config."
  default     = "eb-cli2"
}

# ubuntu-trusty-14.04 (x64)
variable "aws_amis" {
  default = {
    "us-east-1" = "ami-5f709f34"
    "eu-west-2" = "ami-536c8e34"
  }
}

variable "aws_elastic_beanstalk_application_name" {
  description = "Application name"
}

variable "aws_elastic_beanstalk_application_description" {
  description = "Application description"
}

variable "aws_elastic_beanstalk_environment_name" {
  description = "Enviroment name (Member must contain only letters, digits, and the dash character and may not start or end with a dash)"
}

variable "instance_type" {
  default = "t2.micro"
}

#variable "cname" {}

#variable "environment" {
#  description = "the environment identifier used by the service during bootup"
#}
variable "env_default_key" {
  default     = "DEFAULT_ENV_%d"
  description = "Default ENV variable key for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_default_value" {
  default     = "UNSET"
  description = "Default ENV variable value for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}


variable "env_vars" {
  type = "map"
  description = "Map of custom ENV variables to be provided to the application running on Elastic Beanstalk."

  default = {
    DB_CONNECTION = "mysql"
    SECURE = "false"
    AWS_KEY = "Replace aws key here"
    MAIL_DRIVER = "smtp"
    APP_KEY = "Replace app key here"
    DB_PORT = "3306"
    MAIL_USERNAME = "admin@nexusfrontier.tech"
    APP_URL = "domain full urk"
    APP_NAME = "Nexus Frontier Tech"
    BROADCAST_DRIVER = "log"
    APP_LOG_LEVEL = "debug"
    DB_USERNAME = "root"
    MAIL_HOST = "smtp.gmail.com"
    MAIL_ENCRYPTION = "tls"
    AWS_IMAGE_REGION = "eu-west-2"
    AWS_IMAGE_BUCKET = "Aws image bucket"
    DB_PASSWORD = "$${var.database_password}"
    CACHE_DRIVER = "file"
    APP_ENV = "production"
    APP_DEBUG = "false"
    MAIL_FROM_NAME = "Nexus website"
    AWS_SECRET = "AWS secret for s3 action"
    QUEUE_DRIVER = "sync"
    MAIL_PASSWORD = "Email password for smtp"
    MAIL_FROM_ADDRESS = "Email sender"
    SESSION_DRIVER = "file"
    STORAGE_TYPE = "s3"
    MAIL_PORT = "587"
    AWS_SES_REGION = "eu-west-2"
  }
}