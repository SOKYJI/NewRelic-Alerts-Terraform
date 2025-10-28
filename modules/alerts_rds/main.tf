# CPUUtilization > 90%
resource "newrelic_nrql_alert_condition" "rds_cpu_high" {
  policy_id = var.policy_id
  name      = "CPUUtilization 90% 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.rds.CPUUtilization) FACET aws.rds.DBInstanceIdentifier WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.rds_cpu_threshold
    threshold_duration    = 300  # 5분
    threshold_occurrences = "ALL"
  }
}

# FreeableMemory < 500MB
resource "newrelic_nrql_alert_condition" "rds_freeable_memory_low" {
  policy_id = var.policy_id
  name      = "FreeableMemory 500MB 미만"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.rds.FreeableMemory) FACET aws.rds.DBInstanceIdentifier WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.rds_freeable_memory_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# FreeStorageSpace < 1GB
resource "newrelic_nrql_alert_condition" "rds_free_storage_low" {
  policy_id = var.policy_id
  name      = "FreeStorageSpace 1GB 미만"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.rds.FreeStorageSpace) FACET aws.rds.DBInstanceIdentifier WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.rds_free_storage_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# DatabaseConnections > 200
resource "newrelic_nrql_alert_condition" "rds_connections_high" {
  policy_id = var.policy_id
  name      = "DatabaseConnections 200 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.rds.DatabaseConnections) FACET aws.rds.DBInstanceIdentifier WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.rds_connections_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# RDS Read Latency
resource "newrelic_nrql_alert_condition" "rds_read_latency" {
  policy_id = var.policy_id
  name      = "ReadLatency 1초 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.rds.ReadLatency) FACET aws.rds.DBInstanceIdentifier WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.rds_read_latency_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# RDS Write Latency
resource "newrelic_nrql_alert_condition" "rds_write_latency" {
  policy_id = var.policy_id
  name      = "WriteLatency 1초 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.rds.WriteLatency) FACET aws.rds.DBInstanceIdentifier WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.rds_write_latency_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Aurora Replica Lag Maximum
resource "newrelic_nrql_alert_condition" "aurora_replica_lag_max" {
  policy_id = var.policy_id
  name      = "Aurora ReplicaLagMaximum 2초 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT max(aws.rds.AuroraReplicaLagMaximum) FACET aws.rds.DBClusterIdentifier WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.aurora_replica_lag_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}