resource "aws_fms_admin_account" "example" {}


import {
  to = aws_fms_admin_account.example
  id = "123456789012"
}


resource "aws_fms_policy" "example" {
  name                  = "FMS-Policy-Example"
  exclude_resource_tags = false
  remediation_enabled   = true
  resource_type         = "AWS::ElasticLoadBalancingV2::LoadBalancer"
  include_map           = {Account = [#member account number ] #list of member account to include in this policy}
  security_service_policy_data {
    type = "WAF"

    managed_service_data = jsonencode({
      type = "WAF",
      ruleGroups = [{
        id = aws_wafregional_rule_group.example.id
        overrideAction = {
          type = "COUNT"
        }
      }]
      defaultAction = {
        type = "BLOCK"
      }
      overrideCustomerWebACLAssociation = false
    })
  }

  tags = {
    Name = "example-fms-policy"
  }
}

resource "aws_wafregional_rule_group" "example" {
  metric_name = "WAFRuleGroupExample"
  name        = "WAF-Rule-Group-Example"
}




resource "aws_networkfirewall_logging_configuration" "example" {
  firewall_arn = aws_networkfirewall_firewall.example.arn
  logging_configuration {
    log_destination_config {
      log_destination = {
        bucketName = aws_s3_bucket.example.bucket
        prefix     = "/example"
      }
      log_destination_type = "S3"
      log_type             = "FLOW"
    }
  }
}