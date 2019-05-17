variable "credentials" {
  description = "Path to file containing credentials"
  default     = "gcp.json"
}
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

variable "prefix" {
  description = "The prefix used for all resources"
  default = "eschool"
}

#Cluster
variable "cluster" {
  default = "mydevops-cluster"
}

#Network
variable "ip_cidr_range" {
	description = "The address_prefix used for subnetwork ip"
  default = "10.0.1.0/24"
}

variable "countnat" {
	description = "The count nat used for prefix to nat external address"
  default = "1"
}

#DB
variable database_version {
  description = "The version of of the database. `MYSQL-5-7`"
  default     = "MYSQL_5_7"
}

variable tier {
  description = "The machine tier or type. See this page for supported tiers and pricing: https://cloud.google.com/sql/pricing"
  default     = "db-g1-small"
}

variable disk_autoresize {
  description = "Second Generation only. Configuration to increase storage size automatically."
  default     = true
}

variable disk_size {
  description = "Second generation only. The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased."
  default     = 10
}

variable disk_type {
  description = "Second generation only. The type of data disk: `PD_SSD` or `PD_HDD`."
  default     = "PD_SSD"
}

variable db_name {
  description = "Name of the default database to create"
  default     = "eschooldb"
}

variable db_charset {
  description = "The charset for the default database"
  default     = "utf8"
}

variable db_collation {
  description = "The collation for the default database. Example for MySQL databases: 'utf8_general_ci', and Postgres: 'en_US.UTF8'"
  default     = "utf8_general_ci"
}

variable user_name {
  description = "The name of the default user"
  default     = "root"
}

variable user_host {
  description = "The host for the default user"
  default     = "%"
}

variable user_password {
  description = "The password for the default user"
  default     = "IF095eSchool"
}

#Bastion
variable "machine_type_jenkins" {
  default = "n1-standard-2"
}

variable "image" {
    default = "centos-cloud/centos-7"
}

variable "instance_name" {
    default = "jenkins"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "devops095.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "devops095_ossh.pem"
}




