variable "policy_id" {
  type = string
}

# CPUUtilization (above)
variable "ec_cpu_threshold" {
  type    = number
  default = 90
}

# FreeableMemory 00MB 미만(below)
variable "ec_freeable_memory_threshold" {
  type    = number
  default = 314572800   # 300MB (bytes)
}

# SwapUsage 초과 (above)
variable "ec_swap_usage_threshold" {
  type    = number
  default = 20971520    # 20MB (bytes)
}

# Evictions 초과 (above)
variable "ec_evictions_threshold" {
  type    = number
  default = 50
}

# CurrConnections 초과 (above)
variable "ec_connections_threshold" {
  type    = number
  default = 500
}

# EngineCPUUtilization 초과 (above)
variable "ec_engine_cpu_threshold" {
  type    = number
  default = 90
}