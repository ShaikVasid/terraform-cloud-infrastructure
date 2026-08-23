variable "name" { type = string }
variable "vpc_id" { type = string }
variable "tags" { type = map(string) default = {} }

resource "aws_security_group" "application" {
  name        = "${var.name}-application"
  description = "Application security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from trusted network"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.name}-application-sg" })
}
