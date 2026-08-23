variable "name" { type = string }
variable "subnet_id" { type = string }
variable "instance_type" { type = string default = "t3.micro" }
variable "ami_id" { type = string }
variable "tags" { type = map(string) default = {} }

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = false
  tags = merge(var.tags, { Name = "${var.name}-instance" })
}
