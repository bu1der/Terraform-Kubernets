resource "google_compute_network" "eschoolprod" {
  name = "${var.prefix}-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "eschoolprod" {
  name          = "${var.prefix}-subnetwork"
  ip_cidr_range = "${var.ip_cidr_range}"
  region        = "${var.region}"
  network       = "${google_compute_network.eschoolprod.self_link}"
  private_ip_google_access = true

}

resource "google_compute_router" "eschoolprod" {
  name    = "${var.prefix}-router"

  region  = "${google_compute_subnetwork.eschoolprod.region}"
  network = "${google_compute_network.eschoolprod.self_link}"

  bgp {
    asn = 64514
  }
}

resource "google_compute_address" "eschoolprod" {
  count  = "${var.countnat}"
  name   = "${var.prefix}-nat-external-address-${count.index}"
  region = "${var.region}"
}
resource "google_compute_router_nat" "eschoolprod" {
  name                               = "${var.prefix}-nat-1"
  router                             = "${google_compute_router.eschoolprod.name}"
  region                             = "${var.region}"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = ["${google_compute_address.eschoolprod.*.self_link}"]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "ssh-firewall" {
  name    = "${var.prefix}-ssh-firewall"
  network = "${google_compute_network.eschoolprod.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["ssh"]
}

resource "google_compute_firewall" "sonar-firewall" {
  name    = "${var.prefix}-sonar-firewall"
  network = "${google_compute_network.eschoolprod.name}"

  allow {
    protocol = "tcp"
    ports    = ["9000"]
  }
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["sonar"]
}

resource "google_compute_firewall" "web-firewall" {
  name    = "${var.prefix}-web-firewall"
  network = "${google_compute_network.eschoolprod.name}"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["web"]
}