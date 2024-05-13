resource "aws_key_pair" "ssh_key" {
  key_name              = "ssh_key"
  public_key            = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group_rule" "sg" {
  type                  = "ingress"
  from_port             = 0
  to_port               = 65535
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
  
  security_group_id     = "sg-0b36d2dd5ab92c904"
}

resource "aws_instance" "ec2" {
    ami                 = "ami-079db87dc4c10ac91"
    instance_type       = "t2.medium"
    key_name            = aws_key_pair.ssh_key.key_name

    user_data           = file("jenkins.sh")

    provisioner "file" {
        source          = "~/.ssh/id_rsa"
        destination     = "/home/ec2-user/.ssh/id_rsa"

        connection {
            type        = "ssh"
            user        = "ec2-user"
            private_key = file("~/.ssh/id_rsa")
            host        = self.public_dns
        }
    }

    tags = {
        Name            = "jenkins"
    }

    depends_on          = [aws_key_pair.ssh_key, aws_security_group_rule.sg]
}

# Create ECR

module "frontend" {
  source          = "./modules/ecr"
  repository_name = "frontend"
}

module "backend" {
  source          = "./modules/ecr"
  repository_name = "backend"
}