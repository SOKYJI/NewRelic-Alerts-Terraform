resource "newrelic_nrql_alert_condition" "natgw_packets_drop" {
  policy_id = var.policy_id
  name      = "PacketsDrop 발생"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false

  nrql {
    query = "FROM Metric SELECT sum(aws.natgateway.PacketsDropCount) FACET aws.natgateway.NatGatewayId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.natgw_packets_drop_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "natgw_error_port_alloc" {
  policy_id = var.policy_id
  name      = "ErrorPortAllocation 발생"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false

  nrql {
    query = "FROM Metric SELECT sum(aws.natgateway.ErrorPortAllocation) FACET aws.natgateway.NatGatewayId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.natgw_error_port_alloc_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}