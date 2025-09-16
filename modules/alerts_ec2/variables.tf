variable "policy_id" {
  type = string
}

# CPU (above)
variable "cpu_threshold" {
  type    = number
  default = 90
}

# Memory (above)
variable "memory_threshold" {
  type    = number
  default = 90
}

# Disk (above)
variable "disk_threshold" {
  type    = number
  default = 90
}

# Status Checks (above)
variable "status_check_failed_threshold" {
  type    = number
  default = 0
}

variable "system_check_failed_threshold" {
  type    = number
  default = 0
}

variable "instance_check_failed_threshold" {
  type    = number
  default = 0
}

variable "ebs_check_failed_threshold" {
  type    = number
  default = 0
}

# Host Status Shutdown 발생 (below)
variable "host_status_threshold" {
  type    = number
  default = 1
}