data "template_file" "jenkins_conf" {
  template = "${file("${path.module}/templates/jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.tpl")}"
  vars {
    web0_server = "${element(google_compute_instance.jenkins.*.network_interface.0.network_ip, count.index)}"
    web1_server = "localhost"
  }
}
data "template_file" "app_conf" {
  template = "${file("${path.module}/templates/application.properties.tpl")}"
  depends_on = ["google_sql_database_instance.eschoolprod"]
  vars {
    db_server = "localhost"
    db_name = "${var.db_name}"
    db_user = "${var.user_name}"
    db_pass = "${var.user_password}"
  }
}
data "template_file" "job_frontend" {
  template = "${file("${path.module}/templates/job_frontend.tpl")}"
  vars {
    lb_backend = "${google_compute_address.eschoolprod.address}"
    project = "${var.project_name}"
  }
}

data "template_file" "job_backend" {
  template = "${file("${path.module}/templates/job_backend.tpl")}"
  vars {
    project = "${var.project_name}"
  }
}
data "template_file" "deployment_backend" {
  template = "${file("${path.module}/templates/deployment-backend.yml.tpl")}"
  depends_on = ["google_sql_database_instance.eschoolprod"]
  vars {
    project = "${var.project_name}"
    region  = "${var.region}"
    sql_instans_name = "${google_sql_database_instance.eschoolprod.name}"
  }
}
data "template_file" "deployment_frontend" {
  template = "${file("${path.module}/templates/deployment-frontend.yml.tpl")}"
  vars {
    project = "${var.project_name}"
  }
}
data "template_file" "service-backend" {
  template = "${file("${path.module}/templates/service-backend.yml.tpl")}"
  vars {
    lb_backend = "${google_compute_address.eschoolprod.address}"
  }
}