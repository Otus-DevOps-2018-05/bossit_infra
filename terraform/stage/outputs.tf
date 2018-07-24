output "app_external_ip" {
  value = "${module.app.app_external_ip}"
}

# output "app_load_balancing" {
#   value = "${google_compute_forwarding_rule.reddit-lb.ip_address}"
# }

