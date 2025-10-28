# ClusterStatus 확인 불가 (green 상태 측정 불가 시)
resource "newrelic_nrql_alert_condition" "os_cluster_status_unavailable" {
  policy_id = var.policy_id
  name      = "ClusterStatus 확인 불가"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT min(aws.es.ClusterStatus.green) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.os_cluster_green_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# ClusterStatus RED 상태
resource "newrelic_nrql_alert_condition" "os_cluster_status_red" {
  policy_id = var.policy_id
  name      = "ClusterStatus RED 상태"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT max(aws.es.ClusterStatus.red) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.os_cluster_red_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# ClusterStatus YELLOW 상태
resource "newrelic_nrql_alert_condition" "os_cluster_status_yellow" {
  policy_id = var.policy_id
  name      = "ClusterStatus YELLOW 상태"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT max(aws.es.ClusterStatus.yellow) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.os_cluster_yellow_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# FreeStorageSpace < 20GB
resource "newrelic_nrql_alert_condition" "os_free_storage" {
  policy_id = var.policy_id
  name      = "FreeStorageSpace 20GB 미만"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.es.FreeStorageSpace.byCluster) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.os_free_storage_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# ClusterIndexWritesBlocked 발생
resource "newrelic_nrql_alert_condition" "os_index_writos_blocked" {
  policy_id = var.policy_id
  name      = "ClusterIndexWritesBlocked 발생"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT max(aws.es.ClusterIndexWritesBlocked) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.os_index_writes_blocked_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# CPUUtilization > 90%
resource "newrelic_nrql_alert_condition" "os_cpu_high" {
  policy_id = var.policy_id
  name      = "CPUUtilization 90% 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.es.CPUUtilization.byCluster) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.os_cpu_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# JVMMemoryPressure > 90%
resource "newrelic_nrql_alert_condition" "os_jvm_mem_pressure" {
  policy_id = var.policy_id
  name      = "JVMMemoryPressure 90% 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.es.JVMMemoryPressure.byCluster) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.os_jvm_mem_pressure_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}