variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  type = string
}

variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}

variable "tags" {
  default = {
    Component = "catalogue"
  }
}

variable "zone_name" {
  default = "devopsprocloud.in"

}

variable "app_version" {
  # get the value from Jenkinsfile (params.version)
}