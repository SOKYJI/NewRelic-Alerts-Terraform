# UnHealthyHostCount 발생
resource "newrelic_nrql_alert_condition" "nlb_unhealthy_host" {
  policy_id = var.policy_id
  name      = "UnHealthyHostCount 발생"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT max(aws.networkelb.UnHealthyHostCount) FACET aws.networkelb.TargetGroup WITH TIMEZONE 'Asia/Seoul' WHERE aws.networkelb.AvailabilityZone is NULL"
  }

  critical {
    operator              = "above"
    threshold             = var.nlb_unhealthy_host_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# HealthyHost 없음
resource "newrelic_nrql_alert_condition" "nlb_no_healthy_host" {
  policy_id = var.policy_id
  name      = "HealthyHost 없음"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT min(aws.networkelb.HealthyHostCount) FACET aws.networkelb.TargetGroup WITH TIMEZONE 'Asia/Seoul' WHERE aws.networkelb.AvailabilityZone is NULL"
  }

  critical {
    operator              = "below"
    threshold             = var.nlb_healthy_host_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# PortAllocationErrorCount 발생
resource "newrelic_nrql_alert_condition" "nlb_port_alloc_error" {
  policy_id = var.policy_id
  name      = "PortAllocationErrorCount 발생"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT sum(aws.networkelb.PortAllocationErrorCount) FACET entity.name WITH TIMEZONE 'Asia/Seoul' WHERE aws.networkelb.AvailabilityZone is NOT NULL"
  }

  critical {
    operator              = "above"
    threshold             = var.nlb_port_alloc_error_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}