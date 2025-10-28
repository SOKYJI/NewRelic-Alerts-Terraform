# CPUUtilization > 90% (SystemSample, install newrelic-agent)
resource "newrelic_nrql_alert_condition" "ec2_cpu_systemsample" {
  policy_id = var.policy_id
  name      = "CPUUtilization 90% 초과(SystemSample)"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM SystemSample SELECT average(cpuPercent) FACET entityName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.cpu_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# CPUUtilization > 90% (AWS Metric, uninstall newrelic-agent)
resource "newrelic_nrql_alert_condition" "ec2_cpu_metric" {
  policy_id = var.policy_id
  name      = "CPUUtilization 90% 초과(AWS Metric)"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400
  
  nrql {
    query = "FROM Metric SELECT average(aws.ec2.CPUUtilization) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.cpu_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# MemoryUtilization > 90% (SystemSample)
resource "newrelic_nrql_alert_condition" "ec2_memory_systemsample" {
  policy_id = var.policy_id
  name      = "MemoryUtilization 90% 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400
  
  nrql {
    query = "FROM SystemSample SELECT average(memoryUsedPercent) FACET entityName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.memory_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# DiskUtilization > 90% (StorageSample)
resource "newrelic_nrql_alert_condition" "ec2_disk_storagesample" {
  policy_id = var.policy_id
  name      = "DiskUtilization 90% 초과"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400
  
  nrql {
    query = "FROM StorageSample SELECT average(diskUsedPercent) FACET entityName, device WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.disk_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# StatusCheckFailed 발생
resource "newrelic_nrql_alert_condition" "ec2_status_check_failed" {
  policy_id = var.policy_id
  name      = "StatusCheckFailed 발생"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400
  
  nrql {
    query = "FROM Metric SELECT max(aws.ec2.StatusCheckFailed) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.status_check_failed_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# HostStatus Shutdown 발생
resource "newrelic_nrql_alert_condition" "ec2_host_status" {
  policy_id = var.policy_id
  name      = "HostStatus Shutdown 발생"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400
  
  nrql {
    query = "FROM Metric SELECT uniqueCount(host.state) FACET entity.name WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.host_status_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}