variable "policy_id" {
  type = string
}

# PacketsDrop 발생 (above)
variable "natgw_packets_drop_threshold" {
  type    = number
  default = 0
}

# ErrorPortAllocation 발생 (above)
variable "natgw_error_port_alloc_threshold" {
  type    = number
  default = 0
}