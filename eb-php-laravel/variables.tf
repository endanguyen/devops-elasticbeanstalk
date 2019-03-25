#Name of the SSH keypair to use in AWS.https://cloudonaut.io/avoid-sharing-key-pairs-for-ec2/
variable "key_name" {
  default = "nexus-dev"
}

# AWS region to launch servers.
variable "aws_region" {
  default     = "eu-west-2"
}

# 
variable "aws_profile" {
  description = "AWS profile name in .aws/config."
  default = "eb-cli2"
}

# ubuntu-trusty-14.04 (x64)
variable "aws_amis" {
  default = {
    "us-east-1" = "ami-5f709f34"
    "eu-west-2" = "ami-536c8e34"
  }
}

#Application name
variable "aws_elastic_beanstalk_application_name" {
  default = "App test name"
}

#Application description
variable "aws_elastic_beanstalk_application_description" {
  default = "Application description"
}

#Enviroment name (Member must contain only letters, digits, and the dash character and may not start or end with a dash)
variable "aws_elastic_beanstalk_environment_name" {
  default = "test-app-name"
}

variable "instance_type" {
  default = "t2.micro"
}

#Identifier for your DB url of database (Member must contain only letters, digits, and the dash character and may not start or end with a dash)
variable "identifier" {
  default = "test-db-nexus"
}

variable "storage" {
  default     = "20"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "mysql"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"

  default = {
    mysql    = "5.7.21"
    postgres = "9.6.8"
  }
}

#Instance rds type
variable "instance_class" {
  default = "db.t2.micro"
}

#Database name
variable "db_name" {
  default = "database_name"
}

#Database username
variable "database_username" {
  default     = "root"
}

#Database password
variable "database_password" {
  default     = "passwordofdatabase"
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


variable "env_default_key" {
  default     = "DEFAULT_ENV_%d"
  description = "Default ENV variable key for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_default_value" {
  default     = "UNSET"
  description = "Default ENV variable value for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}
