resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.ubuntu.id  # amazon-linux-2
  instance_type = "t2.micro"
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins.id]

   user_data = <<-EOF
#!/bin/bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y fontconfig openjdk-11-jre
  sudo apt-get install -y jenkins
  sudo apt install unzip
  https://releases.hashicorp.com/terraform/0.12.31/terraform_0.12.31_linux_amd64.zip
  unzip terraform_0.12.31_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  sudo apt install git
              EOF

  tags = {
    Name = "jenkins-${terraform.workspace}"
  }
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}