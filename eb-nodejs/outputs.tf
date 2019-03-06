output "app_name" {
  value       = "${aws_elastic_beanstalk_application.default.name}"
  description = "Application name"
}

output "elb_dns_name" {
  value       = "${aws_elastic_beanstalk_environment.default.cname}"
  description = "ELB technical host"
}
output "db_instance_id" {
  value = "${aws_db_instance.default.id}"
}

output "db_instance_address" {
  value = "${aws_db_instance.default.address}"
}
