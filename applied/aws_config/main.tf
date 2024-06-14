
resource "aws_config_configuration_recorder_status" "foo" {
  name       = aws_config_configuration_recorder.foo.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.foo]
}


resource "aws_iam_role_policy_attachment" "a" {
  role       = aws_iam_role.r.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}

resource "aws_s3_bucket" "b" {
  bucket = "awsconfig-example"
}

resource "aws_config_delivery_channel" "foo" {
  name           = "example"
  s3_bucket_name = aws_s3_bucket.b.bucket
}


resource "aws_config_configuration_recorder" "main" {
  name     = "default"
  role_arn = aws_iam_role.config_role.arn
}


data "aws_iam_policy_document" "assume_role' {

  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
       { 
          #Sid: ""
          Effect: "Allow",
          Action: "sts:AssumeRole",
          Principal: {
          "Service": "config.amazonaws.com"
       },
        
      }
    ] 
  })
}
   assume_role_policy = jsonencode({
    Version: "2012-10-17",
	Statement": [
	   {
		 
           Sid": "Statement1",
		   Effect": "Allow",
		   Action": [
				"config:DescribeOrganizationConfigRules",
				"config:DescribeRemediationConfigurations",
				"config:DeliverConfigSnapshot",
				"config:DescribeAggregateComplianceByConfigRules",
				"config:DescribeComplianceByConfigRule",
				"config:DeliverConfigSnapshot",
				"config:DescribeDeliveryChannelStatus",
				"config:DescribeOrganizationConfigRuleStatuses",
				"config:GetComplianceSummaryByConfigRule"
			],
			Resource: []
		}
	]
})

resource "aws_iam_role" "awsconfig_role" {
  name = "awsconfig-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
resource "aws_iam_role_policy" "config_policy" {
  name   = "config-policy"
  role   = aws_iam_role.config_role.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:*",
          "sns:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  })
}

resource "aws_config_delivery_channel" "main" {
  name           = "default"
  s3_bucket_name = aws_s3_bucket.config_bucket.bucket
}

resource "aws_s3_bucket" "config_bucket" {
  bucket = "my-config-bucket"
  acl    = "private"
}

