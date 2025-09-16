variable "policy_id" {
  type = string
}

# ConnectionDown 발생 (below)
variable "vpn_connection_down_threshold" {
  type    = number
  default = 1
}

# TunnelDown 발생 (below)
variable "vpn_tunnel_down_threshold" {
  type    = number
  default = 1
}
