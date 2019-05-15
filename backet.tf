terraform {
  backend "gcs" {
    bucket = "${var.prefix}-stage"
    prefix = "${var.prefix}-terraform"
    credentials = "${var.credentials}"
  }
}