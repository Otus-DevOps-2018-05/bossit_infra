terraform {
  backend "gcs" {
    bucket = "otus-bossit-tf"
    prefix = "stage"
  }
}
