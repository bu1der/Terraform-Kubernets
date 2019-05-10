variable "region" {
  description = "The region that the machine should be created in"
  default = "us-central1"
}

variable "zone" {
  description = "The zone that the machine should be created in"
  default     = "us-central1-c"
}

variable "project_name" {
  description = "The ID of the project"
  default     = "mydevops-234619"
}

variable "cluster" {
  default = "mydevops-cluster"
}