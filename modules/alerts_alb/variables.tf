variable "policy_id" {
  type = string
}

# EBL_4xx_Count Error (above)
variable "alb_4xx_threshold" {
  type    = number
  default = 50
}

# EBL_5xx_Count Error (above)
variable "alb_5xx_threshold" {
  type    = number
  default = 50
}

# Target Response Time (above, 초 단위)
variable "alb_target_response_time_threshold" {
  type    = number
  default = 5
}

# HealthyHost 없음 (equals, 0일 때 알람)
variable "alb_healthy_host_threshold" {
  type    = number
  default = 0
}

# UnHealthyHostCount (above, 0 초과일 때 알람)
variable "alb_unhealthy_host_threshold" {
  type    = number
  default = 0
}