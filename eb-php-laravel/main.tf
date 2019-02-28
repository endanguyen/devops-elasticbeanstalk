# Specify the provider and access details
provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_db_instance" "default" {
  identifier             = "${var.identifier}"
  allocated_storage      = "20"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "root"
  password               = "${var.password}"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "${var.aws_elastic_beanstalk_application_name}"
  description = "${var.aws_elastic_beanstalk_application_description}"
}

resource "aws_elastic_beanstalk_environment" "default" {
  name                = "${var.aws_elastic_beanstalk_environment_name}"
  application         = "${aws_elastic_beanstalk_application.default.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.7.0 running PHP 7.1"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "${var.instance_type}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = "${var.key_name}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any 2"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "EnvironmentType"
    value = "SingleInstance"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "LoadBalancerType"
    value = "application"
  }
  setting {
    namespace = "aws:elasticbeanstalk:container:php:phpini"
    name = "document_root"
    value = "/public"
  }
  ###===================== Application ENV vars ======================###
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    value     = "${aws_db_instance.default.address}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_DATABASE"
    value     = "${var.db_name}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_DATABASE"
    value     = "${var.db_name}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_PASSWORD"
    value     = "${var.password}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 0))), 0)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 0))), 0), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 1))), 1)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 1))), 1), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 2))), 2)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 2))), 2), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 3))), 3)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 3))), 3), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 4))), 4)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 4))), 4), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 5))), 5)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 5))), 5), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 6))), 6)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 6))), 6), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 7))), 7)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 7))), 7), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 8))), 8)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 8))), 8), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 9))), 9)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 9))), 9), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 10))), 10)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 10))), 10), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 11))), 11)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 11))), 11), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 12))), 12)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 12))), 12), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 13))), 13)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 13))), 13), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 14))), 14)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 14))), 14), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 15))), 15)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 15))), 15), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 16))), 16)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 16))), 16), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 17))), 17)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 17))), 17), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 18))), 18)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 18))), 18), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 19))), 19)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 19))), 19), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 20))), 20)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 20))), 20), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 21))), 21)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 21))), 21), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 22))), 22)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 22))), 22), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 23))), 23)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 23))), 23), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 24))), 24)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 24))), 24), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 25))), 25)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 25))), 25), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 26))), 26)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 26))), 26), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 27))), 27)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 27))), 27), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 28))), 28)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 28))), 28), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 29))), 29)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 29))), 29), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 30))), 30)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 30))), 30), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 31))), 31)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 31))), 31), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 32))), 32)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 32))), 32), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 33))), 33)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 33))), 33), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 34))), 34)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 34))), 34), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 35))), 35)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 35))), 35), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 36))), 36)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 36))), 36), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 37))), 37)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 37))), 37), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 38))), 38)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 38))), 38), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 39))), 39)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 39))), 39), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 40))), 40)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 40))), 40), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 41))), 41)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 41))), 41), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 42))), 42)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 42))), 42), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 43))), 43)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 43))), 43), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 44))), 44)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 44))), 44), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 45))), 45)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 45))), 45), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 46))), 46)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 46))), 46), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 47))), 47)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 47))), 47), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 48))), 48)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 48))), 48), var.env_default_value)}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "${element(concat(keys(var.env_vars), list(format(var.env_default_key, 49))), 49)}"
    value     = "${lookup(var.env_vars, element(concat(keys(var.env_vars), list(format(var.env_default_key, 49))), 49), var.env_default_value)}"
  }
}