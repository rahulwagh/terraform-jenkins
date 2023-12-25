bucket_name = "jatto-projects3statebackend"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-proj-jenkins-eu-west-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
eu_availability_zone = ["eu-west-1a", "eu-west-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJRImHzDGcHuOnUjQ423QVyzlKIY6w8+m4koaPcKhxJMNlJewodaEk6ZKRA2VoxyGJOMtpniVVfCTTVcLQFx/ir/YbsfwkRIt6Peg9FzIddu7GLXqlVO1SYrPCTtUMLnRd5Id5NSI8FwnQ6Xyj5r9II9HHheaPDnUcE+b661eIxm1QtxcDqfHU+PTYt4MgdMYOLw1pHduLxjFJWcTig5uiniOUQqg8xuTjWK3p1LUOkXQdr8yOWEscN3NjziCi21vEAqOi467+jXP3nSrhYs3g8+RYZIbNAX3i5IdpqQYt/48XZ6R8QpTPRlYj5rY0tHseGkE42H6C6b5Psg6Kiy1dJxg2y+CPhgo/Ei0n9Lr6OAf9VYegAHVo4dv4/JwGq0u80S1GfNiLGzloVCq8AoiNu85K2QOK70AHOYBCIj1UlFvJBaDtH0h+oXK3k1pyoGnpRcvFJOUyvG/XCQzyt0K2oonb/g0zFGDNjlcl2dFiyLAUJvlpU70u+0LLJs5GqdM= jatto@DESKTOP-5UKOG6S"
ec2_ami_id = "ami-0905a3c97561e0b69"