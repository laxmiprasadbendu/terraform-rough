provider "aws" {
  region  = "us-east-1"
  
  access_key = "AKIAYH5NRM4UZBY6FZOD"
  secret_key = "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"
}

module "eks_k8s1" {
  source  = "terraform-aws-modules/eks/aws"
  

  

  cluster_name = "k8s"
  Vpc_id = "vpc-00000000"

  subnets = ["subnet-00000001", "subnet-000000002", "subnet-000000003"]

  cluster_endpoint_private_access = "true"
  cluster_endpoint_public_access  = "true"

  write_kubeconfig      = true
  config_output_path    = "/.kube/"
  manage_aws_auth       = true
  write_aws_auth_config = true

  map_users = [
    {
      user_arn = "arn:aws:iam::12345678901:user/user1"
      username = "user1"
      group    = "system:masters"
    },
  ]

  worker_groups = [
    {
      name                 = "workers"
      instance_type        = "t2.micro"
      asg_min_size         = 3
      asg_desired_capacity = 3
      asg_max_size         = 3
      root_volume_size     = 10
      root_volume_type     = "gp2"
      ami_id               = "ami-0000000000"
      ebs_optimized     = false
      key_name          = "all"
      enable_monitoring = false
    },
  ]

  tags = {
    Cluster = "k8s"
  }
}
