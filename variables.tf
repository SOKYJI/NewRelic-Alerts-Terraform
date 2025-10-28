variable "nr_account_id" {
  type = string
}

variable "nr_user_api_key" {
  type      = string
  sensitive = true
}

variable "region" {
  type    = string
  default = "US"
}

variable "enabled_modules" {
  type    = list(string)
}

variable "policy_names" {
  type = map(string)
  default = {
    ec2         = "EC2_instance"
    ecs         = "ECS"
    elasticache = "ElastiCache"
    alb         = "ELB_ALB"
    nlb         = "ELB_NLB"
    nat         = "NAT_Gateway"
    opensearch  = "OpenSearch"
    rds         = "RDS"
    vpn         = "Site-to-Site VPN"
    tgw         = "TGW"
    eks         = "EKS"
  }
}