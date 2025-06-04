provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "bucket" {
  name     = "devsecops-${var.env_name}-bucket"
  location = var.region
}
