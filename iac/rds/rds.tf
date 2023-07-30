module  "db" {
  source                      = "terraform-aws-modules/rds/aws"
  identifier                  = "letscodebyada"
  engine                      = "mysql"
  engine_version              = "8.0.33"
  instance_class              = "db.t2.small"
  allocated_storage           = 10
  manage_master_user_password = false

  db_name                     = "letscodebyada"
  username                    = "adaUser"
  password                    = var.rds_password

  family                      = "mysql8.0"
  major_engine_version        = "8.0"
  publicly_accessible         = false

  skip_final_snapshot         = true
  db_subnet_group_name        = aws_db_subnet_group.database-subnet.name
  vpc_security_group_ids      = [aws_security_group.database-sg.id]
}

output "rds_endpoint" {
  value = module.db.db_instance_endpoint
}

resource "aws_db_subnet_group" "database-subnet" {
  name       = "my-db-subnet-group"
  subnet_ids = slice(data.terraform_remote_state.vpc.outputs.vpc_private_subnets, 0, 2)
}

resource "aws_security_group" "database-sg" {
  name_prefix = "rds-sg-"
  description = "Security group for RDS instance"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.100.10.0/24", "10.100.11.0/24", "10.100.12.0/24"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}