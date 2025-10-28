resource "newrelic_nrql_alert_condition" "ecs_cluster_cpu" {
  policy_id = var.policy_id
  name      = "Cluster_CPUUtilization 90% 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.ecs.CPUUtilization.byCluster) FACET aws.ecs.ClusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ecs_cluster_cpu_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ecs_cluster_mem" {
  policy_id = var.policy_id
  name      = "Cluster_MemoryUtilization 90% 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.ecs.MemoryUtilization.byCluster) FACET aws.ecs.ClusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ecs_cluster_mem_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ecs_service_cpu" {
  policy_id = var.policy_id
  name      = "Service_CPUUtilization 90% 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.ecs.CPUUtilization.byService) FACET aws.ecs.ServiceName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ecs_service_cpu_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "ecs_service_mem" {
  policy_id = var.policy_id
  name      = "Service_MemoryUtilization 90% 초과" 

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM Metric SELECT average(aws.ecs.MemoryUtilization.byService) FACET aws.ecs.ServiceName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.ecs_service_mem_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}