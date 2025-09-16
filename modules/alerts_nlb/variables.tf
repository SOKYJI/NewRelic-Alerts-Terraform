variable "policy_id" {
  type = string
}

# UnHealthyHostCount (0 초과 시 알람)
variable "nlb_unhealthy_host_threshold" {
  type    = number
  default = 0
}

# HealthyHost 없음 (below) - Healthy Host 수가 0이면 알람
variable "nlb_healthy_host_threshold" {
  type    = number
  default = 1
}

# PortAllocationErrorCount 발생 (aobve)
variable "nlb_port_alloc_error_threshold" {
  type    = number
  default = 0
}