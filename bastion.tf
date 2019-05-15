resource "google_compute_instance" "jenkins" {
  name         = "${var.prefix}-bastion"
  machine_type = "${var.machine_type_jenkins}"
  tags = ["ssh","sonar"]
  

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.eschoolprod.name}"
    access_config = {
      }
  }
   metadata {
    sshKeys = "centos:${file("${var.public_key_path}")}"
   }

   metadata_startup_script = <<SCRIPT
sudo yum -y update
sudo yum -y install epel-release
sudo yum -y install ansible
SCRIPT
}