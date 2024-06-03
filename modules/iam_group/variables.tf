variable "group_name" {
    description = "The name of the group to be created"
    type = string
}

variable "managed_policies_to_attach" {
    description = "list of AWS managed policy arns to attach to the user group"
    type = list(any)
    default = []
}

variable "inline_policy_to_attach" {
    description = "json of the inline policy arns to attach to the user group" 
    type = string
    default = null
}

variable "policy_name"  {
    description = "Name to be given to the inline policy created"
    type        = string
    default     = null
}

variable "policy_description"  {
    type = string
    default = null
}

variable "region"  {
    type = string
}
