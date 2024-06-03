module "developer_group" {
     source = "../../..//modules/iam_group"

     group_name = "developer_group"
     region     = "us-east-1"
     policy_name = "developer_group_managed_policies"
     policy_description = "cloudengineer_developer_group_inline_policies"
     inline_policy_to_attach = data.aws_iam_policy_document.developer_group_inline_policy.json
     managed_policies_to_attach = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
     ]
}

    data "aws_iam_policy_document" "developer_group_inline_policy" {
        statement {
            sid = ""
            actions = [
                "cloudtrail:*",
                "cloudwatch:*"
            ]
            resources = ["*"]
        }

        statement {
            sid = ""
            actions = [
               "ec2:*",
               "s3:*"
            ]
            resources = ["*"]
     }
    }