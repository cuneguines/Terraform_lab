# EC2 Instances in public subnets
resource "aws_instance" "web" {
  count                     = 2
  ami                       = "ami-0c02fb55956c7d316" # Update for your region
  instance_type             = "t2.micro"
  subnet_id                 = element([aws_subnet.public_1.id, aws_subnet.public_2.id], count.index)
  vpc_security_group_ids    = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  # Install Nginx and create pages automatically
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y

              # Create index.html showing instance ID and AZ
              echo "Hello from $(curl http://169.254.169.254/latest/meta-data/instance-id) in AZ $(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)" > /usr/share/nginx/html/index.html

              # Create /this page showing instance ID
              echo "This is /this page from $(curl http://169.254.169.254/latest/meta-data/instance-id)" > /usr/share/nginx/html/this

              # Enable and start Nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "web-server-${count.index + 1}"
  }
}
