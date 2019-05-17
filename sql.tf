data "null_data_source" "eschoolprod_mysql" {
  count  = "${var.countnat}"
  inputs = {
    name  = "nat-${count.index + 1}"
    value = "${element(google_compute_address.eschoolprod.*.address, count.index)}"
    
  }
}

resource "google_sql_database_instance" "eschoolprod" {
    name               = "${var.prefix}-mysql-servi"
    region             = "${var.region}"
    database_version   = "${var.database_version}"

    settings {
        tier             = "${var.tier}"
        disk_autoresize  = "${var.disk_autoresize}"
        disk_size        = "${var.disk_size}"
        disk_type        = "${var.disk_type}"
        ip_configuration {
            ipv4_enabled = "true"
            authorized_networks = [
               "${data.null_data_source.eschoolprod_mysql.*.outputs}",
            ]
        }
    }
}
resource "google_sql_database" "eschoolprod" {
  name      = "${var.db_name}"
  project   = "${var.project_name}"
  instance  = "${google_sql_database_instance.eschoolprod.name}"
  charset   = "${var.db_charset}"
  collation = "${var.db_collation}"
}

resource "google_sql_user" "eschoolprod" {
  name     = "${var.user_name}"
  project  = "${var.project_name}"
  instance = "${google_sql_database_instance.eschoolprod.name}"
  host     = "${var.user_host}"
  password = "${var.user_password}"
}