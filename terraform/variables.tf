variable "commn_tags" {
  default = {
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = true
  }
}

variable "tags" {
  default = {
    Component = "catalogue"
  }
}

variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "zone_name" {
  default = "pjdevops.online"
}

variable "iam_instance_profile" {
  default = "ShellScriptRoleForRoboshop"
}

variable "app_version" {
  
}

