variable "policy_id" {
  type = string
}

# Cluster CPU thresholds (above)
variable "ecs_cluster_cpu_threshold" {
  type    = number
  default = 90
}

# Cluster Memory thresholds (above)
variable "ecs_cluster_mem_threshold" {
  type    = number
  default = 90
}

# Service CPU thresholds (above)
variable "ecs_service_cpu_threshold" {
  type    = number
  default = 90
}

# Service Memory thresholds (above)
variable "ecs_service_mem_threshold" {
  type    = number
  default = 90
}