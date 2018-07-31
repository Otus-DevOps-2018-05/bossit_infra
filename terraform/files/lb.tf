# create instance template 
resource "google_compute_instance_template" "reddit-template" {
  name         = "reddit-template"
  machine_type = "${var.machine_type}"
  region       = "${var.region}"
  tags         = ["reddit-app"]

  disk {
    source_image = "reddit-base"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }
}

# create health-check
resource "google_compute_http_health_check" "login-health-check" {
  name         = "login-health-check"
  request_path = "/login"

  port               = "${var.puma_port}"
  timeout_sec        = 5
  check_interval_sec = 60
}

# create pool
resource "google_compute_target_pool" "reddit-pool" {
  name = "reddit-pool"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  health_checks = [
    "${google_compute_http_health_check.login-health-check.self_link}",
  ]
}

# create forwarding rule 
resource "google_compute_forwarding_rule" "reddit-lb" {
  name        = "reddit-lb"
  description = "Define forwarding rule for load balancer"

  target     = "${google_compute_target_pool.reddit-pool.self_link}"
  port_range = "9292"
}
