resource "aws_iam_group" "user_group" {
  name = var.group_name
}

resource "aws_iam_group_policy_attachment" "user_group_managed_policy" {
  for_each = toset(var.managed_policies_to_attach)
  group      = aws_iam_group.user_group.name
  policy_arn = each.value
}

resource "aws_iam_policy" "user_group_inline_policy" {
  count =  var.inline_policy_to_attach != "" ? 1 : 0
  name  = var.policy_name 
  description =  var.policy_description
  policy       = var.inline_policy_to_attach
}


resource "aws_iam_group_policy_attachment" "test-attach" {
  count =  var.inline_policy_to_attach != "" ? 1 : 0
  group      = aws_iam_group.user_group.name
  policy_arn = aws_iam_policy.user_group_inline_policy[0].arn
}