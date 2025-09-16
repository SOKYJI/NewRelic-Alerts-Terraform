# Policy 생성 담당
# 만들어진 policy_id를 모듈에 넘겨주어, 모듈 안에서 Condition들이 그 Policy에 붙음
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.0"
    }
  }
}

provider "newrelic" {
  account_id = var.nr_account_id
  api_key    = var.nr_user_api_key
  region     = var.region
}

# Policy들을 map으로 정의
resource "newrelic_alert_policy" "policies" {
  for_each = toset(var.enabled_modules)
  name     = var.policy_names[each.key]   # EC2, ALB, VPN 같은 이름 자동 생성
}

module "alerts_ec2" {
  source    = "./modules/alerts_ec2"
  count     = contains(var.enabled_modules, "ec2") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["ec2"].id
}

module "alerts_ecs" {
  source    = "./modules/alerts_ecs"
  count     = contains(var.enabled_modules, "ecs") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["ecs"].id
}

module "alerts_elasticache" {
  source    = "./modules/alerts_elasticache"
  count     = contains(var.enabled_modules, "elasticache") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["elasticache"].id
}

module "alerts_alb" {
  source    = "./modules/alerts_alb"
  count     = contains(var.enabled_modules, "alb") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["alb"].id
}

module "alerts_nlb" {
  source    = "./modules/alerts_nlb"
  count     = contains(var.enabled_modules, "nlb") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["nlb"].id
}

module "alerts_nat" {
  source    = "./modules/alerts_nat"
  count     = contains(var.enabled_modules, "nat") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["nat"].id
}

module "alerts_opensearch" {
  source    = "./modules/alerts_opensearch"
  count     = contains(var.enabled_modules, "opensearch") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["opensearch"].id
}

module "alerts_rds" {
  source    = "./modules/alerts_rds"
  count     = contains(var.enabled_modules, "rds") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["rds"].id
}

module "alerts_vpn" {
  source    = "./modules/alerts_vpn"
  count     = contains(var.enabled_modules, "vpn") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["vpn"].id
}

module "alerts_tgw" {
  source    = "./modules/alerts_tgw"
  count     = contains(var.enabled_modules, "tgw") ? 1 : 0
  policy_id = newrelic_alert_policy.policies["tgw"].id
}