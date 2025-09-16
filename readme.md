## 1. 지표 Threshold 값 수정
- 운영환경정의서에 따라 ./modules/alerts_{resource}/variables.tf 파일에서 값 수정
- ./terraform.tfvars 에서 뉴렐릭 어카운트, user_api_key 입력
- 뉴렐릭 Alert 설정하고자 하는 인스턴스만 입력
  - 예: ["ec2", "rds"]

## 2. Terraform 실행
terraform init   # provider 다운로드
terraform plan   # 적용될 리소스 미리 확인
terraform apply -auto-approve  # New Relic에 배포




### 디렉터리 구조
```bash
nr-alerts/               # Root 프로젝트 (여기서 terraform init/apply 실행)
 ├── main.tf             # Root main.tf (Policy 생성 + 모듈에 policy_id 전달)
 ├── variables.tf        # Root 변수 정의(account-id, user-api, region 등)
 ├── terraform.tfvars    # Root 변수 값
 └── modules/
      ├── ec2_alerts/
      │    ├── main.tf       # 모듈 내부 main.tf (조건 정의)
      │    └── variables.tf  # 모듈 내부 변수 정의
      ├── rds_alerts/
      │    ├── main.tf
      │    └── variables.tf
      └── alb_alerts/
           ├── main.tf
           └── variables.tf
```



### Example Usage
```cs
resource "newrelic_alert_policy" "foo" {
  name = "foo"
}

resource "newrelic_nrql_alert_condition" "foo" {
  account_id                     = 12345678
  policy_id                      = newrelic_alert_policy.foo.id
  type                           = "static"    #(default)
  name                           = "foo"
  description                    = "Alert when transactions are taking too long"     #(option)
  title_template                 = "Issue in environment: {{ tags.environment }}"     #(option)
  runbook_url                    = "https://www.example.com"     #(option) : Runbook URL to display in notifications.
  enabled                        = true     #(option) : default-true (treu/false)
  violation_time_limit_seconds   = 3600     #(option)
  fill_option                    = "static"     #(option)
  fill_value                     = 1.0     #(option)
  aggregation_window             = 60     #(option)
  aggregation_method             = "event_flow"     #(option) : default - event_flow
  aggregation_delay              = 120     #(option)
  expiration_duration            = 120     #(option)
  open_violation_on_expiration   = true     #(option)
  close_violations_on_expiration = true     #(option)
  ignore_on_expected_termination = true     #(option)
  slide_by                       = 30     #(option)

  nrql {
    query = "SELECT average(duration) FROM Transaction where appName = 'Your App'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}
```