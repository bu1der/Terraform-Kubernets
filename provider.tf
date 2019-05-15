# Specify the provider GCP
provider "google" {
  credentials = "${var.credentials}"
  project = "${var.project_name}"
  region = "${var.region}"
  zone = "${var.zone}"
  }
