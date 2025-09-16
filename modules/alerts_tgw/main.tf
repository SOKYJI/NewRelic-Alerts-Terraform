# PacketDropCountBlackhole 발생
resource "newrelic_nrql_alert_condition" "tgw_packet_drop_blackhole" {
  policy_id = var.policy_id
  name      = "PacketDropCountBlackhole 발생"

  nrql {
    query = "FROM Metric SELECT sum(aws.transitgateway.PacketDropCountBlackhole) FACET aws.transitgateway.TransitGatewayAttachment WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.tgw_packet_drop_blackhole_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# PacketDropCountNoRoute 발생
resource "newrelic_nrql_alert_condition" "tgw_packet_drop_noroute" {
  policy_id = var.policy_id
  name      = "PacketDropCountNoRoute 발생"

  nrql {
    query = "FROM Metric SELECT sum(aws.transitgateway.PacketDropCountNoRoute) FACET aws.transitgateway.TransitGatewayAttachment WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.tgw_packet_drop_noroute_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# PacketDropCountTTLExpired 발생
resource "newrelic_nrql_alert_condition" "tgw_packet_drop_ttl_expired" {
  policy_id = var.policy_id
  name      = "PacketDropCountTTLExpired 발생"

  nrql {
    query = "FROM Metric SELECT sum(aws.transitgateway.PacketDropCountTTLExpired) FACET aws.transitgateway.TransitGatewayAttachment WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.tgw_packet_drop_ttl_expired_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}