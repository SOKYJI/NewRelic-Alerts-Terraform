#####################################
# 공통: 정책 ID와 클러스터 필터 사용
#####################################

# Container Cpu Utilization
resource "newrelic_nrql_alert_condition" "container_cpu_utilization" {
  policy_id = var.policy_id
  name      = "Container Cpu Utilization"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sContainerSample SELECT average(cpuUsedCores) WHERE clusterName IN ${var.cluster_in_clause} FACET containerName, podName, namespaceName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_container_cpu_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Container is Restarting
resource "newrelic_nrql_alert_condition" "container_is_restarting" {
  policy_id = var.policy_id
  name      = "Container is Restarting"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sContainerSample SELECT sum(restartCountDelta) WHERE clusterName IN ${var.cluster_in_clause} FACET containerName, podName, namespaceName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_container_restart_delta_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Container Memory Used (Percent)
resource "newrelic_nrql_alert_condition" "container_memory_used_percent" {
  policy_id = var.policy_id
  name      = "Container Memory Used (Percent)"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sContainerSample SELECT average(memoryWorkingSetUtilization) WHERE clusterName IN ${var.cluster_in_clause} FACET containerName, podName, namespaceName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_container_mem_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Container 공간 부족
resource "newrelic_nrql_alert_condition" "container_fs_used_percent_high" {
  policy_id = var.policy_id
  name      = "Container 공간 부족"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sContainerSample SELECT average(fsUsedPercent) WHERE clusterName IN ${var.cluster_in_clause} FACET containerName, podName, namespaceName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_container_fs_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Container 재시작
resource "newrelic_nrql_alert_condition" "container_restart_growth" {
  policy_id = var.policy_id
  name      = "Container 재시작"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sContainerSample SELECT latest(restartCount) - earliest(restartCount) WHERE clusterName IN ${var.cluster_in_clause} FACET containerName, podName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_container_restart_growth_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Deployment is missing Pods
resource "newrelic_nrql_alert_condition" "deployment_missing_pods" {
  policy_id = var.policy_id
  name      = "Deployment is missing Pods"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sDeploymentSample SELECT latest(podsMissing) WHERE clusterName IN ${var.cluster_in_clause} FACET deploymentName, namespaceName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_deploy_missing_pods_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Node allocatable cpu utilization is high
resource "newrelic_nrql_alert_condition" "node_allocatable_cpu_high" {
  policy_id = var.policy_id
  name      = "Node allocatable cpu utilization is high"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sNodeSample SELECT average(allocatableCpuCoresUtilization) WHERE clusterName IN ${var.cluster_in_clause} FACET nodeName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_node_alloc_cpu_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Node allocatable Memory utilization is high
resource "newrelic_nrql_alert_condition" "node_allocatable_memory_high" {
  policy_id = var.policy_id
  name      = "Node allocatable Memory utilization is high"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sNodeSample SELECT average(allocatableMemoryUtilization) WHERE clusterName IN ${var.cluster_in_clause} FACET nodeName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_node_alloc_mem_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Node is not ready
resource "newrelic_nrql_alert_condition" "node_not_ready" {
  policy_id = var.policy_id
  name      = "Node is not ready"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sNodeSample SELECT latest(condition.Ready) WHERE clusterName IN ${var.cluster_in_clause} FACET nodeName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "below"
    threshold             = var.eks_node_ready_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Node is unschedulable
resource "newrelic_nrql_alert_condition" "node_unschedulable" {
  policy_id = var.policy_id
  name      = "Node is unschedulable"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sNodeSample SELECT latest(unschedulable) WHERE clusterName IN ${var.cluster_in_clause} FACET nodeName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_node_unschedulable_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Node Pod count nearing capacity (50%)
resource "newrelic_nrql_alert_condition" "node_pod_capacity_high" {
  policy_id = var.policy_id
  name      = "Node Pod count nearing capacity (50%)"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sPodSample, K8sNodeSample SELECT ceil(filter(uniqueCount(podName), WHERE status = 'Running') / latest(capacityPods) * 100) AS 'Pod Capacity %' WHERE nodeName IS NOT NULL AND clusterName IN ${var.cluster_in_clause} FACET nodeName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_node_pod_capacity_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Node root file system capacity utilization is high
resource "newrelic_nrql_alert_condition" "node_root_fs_capacity_high" {
  policy_id = var.policy_id
  name      = "Node root file system capacity utilization is high"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sNodeSample SELECT average(fsCapacityUtilization) WHERE clusterName IN ${var.cluster_in_clause} FACET nodeName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_node_rootfs_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Persistent Volume has errors
resource "newrelic_nrql_alert_condition" "persistent_volume_errors" {
  policy_id = var.policy_id
  name      = "Persistent Volume has errors"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sPersistentVolumeSample SELECT uniqueCount(volumeName) WHERE statusPhase IN ('Failed','Pending') AND clusterName IN ${var.cluster_in_clause} FACET volumeName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_pv_errors_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Pod cannot be scheduled
resource "newrelic_nrql_alert_condition" "pod_unscheduled" {
  policy_id = var.policy_id
  name      = "Pod cannot be scheduled (Pod를 예약할 수 없음)"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sPodSample SELECT latest(isScheduled) WHERE clusterName IN ${var.cluster_in_clause} FACET podName, namespaceName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "equals"
    threshold             = var.eks_pod_unscheduled_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

# Pod is not Running
resource "newrelic_nrql_alert_condition" "pod_not_running" {
  policy_id = var.policy_id
  name      = "Pod is not Running"

  expiration_duration            = 600
  close_violations_on_expiration = true
  open_violation_on_expiration   = false
  ignore_on_expected_termination = false
  violation_time_limit_seconds   = 86400

  nrql {
    query = "FROM K8sPodSample SELECT latest(isReady) WHERE status NOT IN ('Running') AND clusterName IN ${var.cluster_in_clause} FACET podName, namespaceName, clusterName WITH TIMEZONE 'Asia/Seoul'"
  }

  critical {
    operator              = "above"
    threshold             = var.eks_pod_not_running_critical_threshold
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
} 