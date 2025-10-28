resource "newrelic_nrql_alert_condition" "ec_cpu" {
  policy_id = var.policy_id
  name      = "CPUUtilization 90% 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.elasticache.CPUUtilization) FACET aws.elasticache.CacheClusterId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ec_cpu_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ec_freeable_memory" {
  policy_id = var.policy_id
  name      = "FreeableMemory 300MB 미만"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.elasticache.FreeableMemory) FACET aws.elasticache.CacheClusterId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.ec_freeable_memory_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ec_swap_usage" {
  policy_id = var.policy_id
  name      = "SwapUsage 20MB 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.elasticache.SwapUsage) FACET aws.elasticache.CacheClusterId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ec_swap_usage_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ec_evictions" {
  policy_id = var.policy_id
  name      = "Evictions 50 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.elasticache.Evictions) FACET aws.elasticache.CacheClusterId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ec_evictions_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ec_connections" {
  policy_id = var.policy_id
  name      = "CurrConnections 500 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.elasticache.CurrConnections) FACET aws.elasticache.CacheClusterId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ec_connections_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ec_engine_cpu" {
  policy_id = var.policy_id
  name      = "EngineCPUUtilization 90% 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.elasticache.EngineCPUUtilization) FACET aws.elasticache.CacheClusterId WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ec_engine_cpu_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}