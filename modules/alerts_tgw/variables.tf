variable "policy_id" {
  type = string
}

# PacketDropCountBlackhole 발생 (above)
variable "tgw_packet_drop_blackhole_threshold" {
  type    = number
  default = 0   # 0 초과 시 알람
}

# PacketDropCountNoRoute 발생 (above)
variable "tgw_packet_drop_noroute_threshold" {
  type    = number
  default = 0
}

# PacketDropCountTTLExpired 발생 (above)
variable "tgw_packet_drop_ttl_expired_threshold" {
  type    = number
  default = 0
}