variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable "zone" {
  description = "Zone"
  default     = "europe-west1-b"
}

variable "machine_type" {
  default = "g1-small"
}

variable "count" {
  default = 1
}

variable "puma_port" {
  default = 9292
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
