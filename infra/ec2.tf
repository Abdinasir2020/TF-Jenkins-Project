resource "aws_instance" "example" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = var.instance_type

  tags = {
    Name = "example-instance-${terraform.workspace}"
  }
}