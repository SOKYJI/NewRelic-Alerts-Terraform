variable "policy_id" {
  type = string
}

# ClusterStatus 확인 불가 (below)
variable "os_cluster_green_threshold" {
  type    = number
  default = 1   # green=1, 1 미만이면 확인 불가
}

# ClusterStatus RED 상태 (above)
variable "os_cluster_red_threshold" {
  type    = number
  default = 0   # 0 초과 = red
}

# ClusterStatus YELLOW 상태 (above)
variable "os_cluster_yellow_threshold" {
  type    = number
  default = 0   # 0 초과 = yellow
}

# FreeStorageSpace 20GB 미만 (below)
variable "os_free_storage_threshold" {
  type    = number
  default = 21474836480   # 20GB (bytes)
}

# Cluster Index Writes Blocked 발생 (above)
variable "os_index_writes_blocked_threshold" {
  type    = number
  default = 0
}

# CPUUtilization 90% 초과 (above)
variable "os_cpu_threshold" {
  type    = number
  default = 90
}

# JVM Memory Pressure 초과 (above)
variable "os_jvm_mem_pressure_threshold" {
  type    = number
  default = 90
}