resource "newrelic_nrql_alert_condition" "alb_4xx_count" {
  policy_id = var.policy_id
  name      = "HTTPCode_ELB_4XX_Count 50 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false

  nrql {
    query = "FROM Metric SELECT sum(aws.applicationelb.HTTPCode_ELB_4XX_Count) FACET entity.name WITH TIMEZONE 'Asia/Seoul' WHERE aws.applicationelb.AvailabilityZone is NULL"
  }

  critical {
    operator              = "above"
    threshold             = var.alb_4xx_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "alb_5xx_count" {
  policy_id = var.policy_id
  name      = "HTTPCode_ELB_5XX_Count 50 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false

  nrql {
    query = "FROM Metric SELECT sum(aws.applicationelb.HTTPCode_ELB_5XX_Count) FACET entity.name WITH TIMEZONE 'Asia/Seoul' WHERE aws.applicationelb.AvailabilityZone is NULL"
  }

  critical {
    operator              = "above"
    threshold             = var.alb_5xx_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "alb_TargetResponseTime" {
  policy_id = var.policy_id
  name      = "TargetResponseTime 5초 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false

  nrql {
    query = "FROM Metric SELECT average(aws.applicationelb.TargetResponseTime) FACET aws.applicationelb.TargetGroup WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.alb_target_response_time_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "alb_no_healthyhost" {
  policy_id = var.policy_id
  name      = "HealthyHost 없음" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false

  nrql {
    query = "FROM Metric SELECT min(aws.applicationelb.HealthyHostCount) FACET aws.applicationelb.TargetGroup WITH TIMEZONE 'Asia/Seoul' WHERE aws.applicationelb.AvailabilityZone is NULL"
  }

  critical {
    operator              = "equals"
    threshold             = var.alb_healthy_host_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "alb_unhealthy_hostcount" {
  policy_id = var.policy_id
  name      = "UnHealthyHostCount 발생" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false

  nrql {
    query = "FROM Metric SELECT max(aws.applicationelb.UnHealthyHostCount) FACET aws.applicationelb.TargetGroup WITH TIMEZONE 'Asia/Seoul' WHERE aws.applicationelb.AvailabilityZone is NULL"
  }

  critical {
    operator              = "above"
    threshold             = var.alb_unhealthy_host_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}
