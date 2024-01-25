bucket_name = "dev-proj-1-jenkins-remote-state-bucket-123456"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-proj-jenkins-eu-west-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
eu_availability_zone = ["eu-west-1a", "eu-west-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz7u2tSNTmvCPuYD06vQafDXvYEsOg5jlJJbmsypgDfNSOqU0xT0TmddLaiUfenIXJD+CIXyTMb1d1YyctHSMVaas6wFcDE//PPx9KOQGoT+HvL0C/rhqehtpP9Q7VbiVDlgr7iKQ74wW5DvCC3ZdRpbbdcJYWip+b9D3E15M72AK59u0mNAuEjZV0JyNL3KBS+qCkFvBiZ6JjLhIKP5iZNTWYoCVa/e7OKNylhgjcZiW9tc7v/++jEqdEkKbjHRqPOJ/xWNziB9cOi+G1C3y1jUvDzTxa6aGNK9zVVetEguxsf0cvu5caenxzpW1Yv14Ve9LjO6UVZmdV6yB2X4bz admin@LAPTOP-2C474AQ7"
ec2_ami_id = "ami-0905a3c97561e0b69"