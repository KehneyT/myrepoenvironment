module "security_group" {
     source = "../../..//modules/iam_group"

     group_name = "security_group"
     region     = "us-east-1"
     policy_name = "security_group_managed_policies"
     policy_description = "cloudengineer_security_group_inline_policies"
     inline_policy_to_attach = data.aws_iam_policy_document.security_group_inline_policy.json
     managed_policies_to_attach = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
     ]
}

    data "aws_iam_policy_document" "security_group_inline_policy" {
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
            resources =["*"]
        } 
     }