resource "aws_instance" "my_instance" {
	ami = "ami-017fecd1353bcc96e"
	instance_type = "t2.micro"
        subnet_id = "${var.public_subnet_id}"
        vpc_security_group_ids = "${var.vpc_security_group_ids}"
	user_data = "${file("${path.module}/install_apache.sh")}"
	tags = {
		Name = "${var.project}-instance"
		Environment = "${var.environment}"
	}
}
