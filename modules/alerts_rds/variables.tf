variable "policy_id" {
  type = string
}

# CPU Utilization  초과 (above, %)
variable "rds_cpu_threshold" {
  type    = number
  default = 90
}

# FreeableMemory 미만 (below, 500MB (bytes)) 
variable "rds_freeable_memory_threshold" {
  type    = number
  default = 524288000 
}

# FreeStorageSpace 미만 (below, 1GB (bytes) ) 
variable "rds_free_storage_threshold" {
  type    = number
  default = 1073741824  
}

# DB Connections 초과 (above, count)
variable "rds_connections_threshold" {
  type    = number
  default = 200  
}

# Read Latency 초과 (above, seconds)
variable "rds_read_latency_threshold" {
  type    = number
  default = 1
}

# Write Latency (above, seconds)
variable "rds_write_latency_threshold" {
  type    = number
  default = 1
}

# Aurora Replica Lag Maximum 초과 (above, seconds)
variable "aurora_replica_lag_threshold" {
  type    = number
  default = 2
}