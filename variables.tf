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

variable "prefix" {
  description = "The prefix used for all resources"
  default = "eschool"
}

variable "ip_cidr_range" {
	description = "The address_prefix used for subnetwork ip"
  default = "10.0.1.0/24"
}

variable "countnat" {
	description = "The count nat used for prefix to nat external address"
  default = "1"
}