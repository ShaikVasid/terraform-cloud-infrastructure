variable "name" { type = string }
variable "subnet_id" { type = string }
variable "instance_type" { type = string default = "t3.micro" }
variable "ami_id" { type = string }
variable "tags" { type = map(string) default = {} }
