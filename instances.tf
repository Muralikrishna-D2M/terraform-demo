resource "aws_instance" "webserver" {
    count = "${var.ec2_count}"
    ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"


  tags = {
      Name = "Disys"
      platform = "Linux"
  }
}
resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = 0.0.0.0/0
  security_group_id = "sg-0798fd77acd72f318"
}
