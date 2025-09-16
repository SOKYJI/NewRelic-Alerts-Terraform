# ConnectionDown 발생 (VPN 연결 단위)
resource "newrelic_nrql_alert_condition" "vpn_connection_down" {
  policy_id = var.policy_id
  name      = "ConnectionDown 발생"

  nrql {
    query = "FROM Metric SELECT min(aws.vpn.TunnelState) FACET aws.vpn.VpnId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.vpn_connection_down_threshold
    threshold_duration    = 300    
    threshold_occurrences = "ALL"
  }
}

# TunnelDown 발생 (터널 IP 단위)
resource "newrelic_nrql_alert_condition" "vpn_tunnel_down" {
  policy_id = var.policy_id
  name      = "TunnelDown 발생"

  nrql {
    query = "FROM Metric SELECT min(aws.vpn.TunnelState) FACET aws.vpn.TunnelIpAddress WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.vpn_tunnel_down_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}