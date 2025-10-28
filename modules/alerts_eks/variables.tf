#####################################
# 공통 변수
#####################################
variable "policy_id" {
  description = "New Relic alert policy ID"
  type        = number
}

# NRQL의 IN (...) 절을 그대로 넣는 문자열
# 예) "('cluster-an2-themarket-prod')" 또는 "('cluster-a','cluster-b')"
variable "cluster_in_clause" {
  description = "NRQL IN 절용 클러스터 문자열"
  type        = string
  default     = "('cluster-an2-themarket-prod')"
}

#####################################
# Container Cpu Utilization
#####################################
variable "eks_container_cpu_critical_threshold" {
  type    = number
  default = 90
}

#####################################
# Container is Restarting (restartCountDelta)
#####################################
variable "eks_container_restart_delta_critical_threshold" {
  type    = number
  default = 1
}

#####################################
# Container Memory Used (Percent)
#####################################
variable "eks_container_mem_critical_threshold" {
  type    = number
  default = 90
}

#####################################
# Container 공간 부족 (fsUsedPercent)
#####################################
variable "eks_container_fs_critical_threshold" {
  type    = number
  default = 90
}

#####################################
# Container 재시작 (latest - earliest)
#####################################
variable "eks_container_restart_growth_critical_threshold" {
  type    = number
  default = 0
}

#####################################
# Deployment is missing Pods
#####################################
variable "eks_deploy_missing_pods_critical_threshold" {
  type    = number
  default = 0
}

#####################################
# Node allocatable CPU utilization
#####################################
variable "eks_node_alloc_cpu_critical_threshold" {
  type    = number
  default = 80
}

#####################################
# Node allocatable Memory utilization
#####################################
variable "eks_node_alloc_mem_critical_threshold" {
  type    = number
  default = 80
}

#####################################
# Node is not ready (below 1)
#####################################
variable "eks_node_ready_critical_threshold" {
  type    = number
  default = 1
}

#####################################
# Node is unschedulable
#####################################
variable "eks_node_unschedulable_critical_threshold" {
  type    = number
  default = 0
}

#####################################
# Node Pod count nearing capacity (%)
#####################################
variable "eks_node_pod_capacity_critical_threshold" {
  type    = number
  default = 50
}

#####################################
# Node root file system capacity utilization
#####################################
variable "eks_node_rootfs_critical_threshold" {
  type    = number
  default = 90
}

#####################################
# Persistent Volume has errors (uniqueCount)
#####################################
variable "eks_pv_errors_critical_threshold" {
  type    = number
  default = 1
}

#####################################
# Pod cannot be scheduled (equals 0)
#####################################
variable "eks_pod_unscheduled_critical_threshold" {
  type    = number
  default = 0
}

#####################################
# Pod is not Running (latest isReady on non-Running pods)
#####################################
variable "eks_pod_not_running_critical_threshold" {
  type    = number
  default = 0
}