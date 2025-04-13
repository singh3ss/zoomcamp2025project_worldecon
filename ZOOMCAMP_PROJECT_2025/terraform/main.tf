terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.16.0"
    }
  }
}

provider "google" {
  credentials = var.credentials  
  project     = var.project
  region      = var.region
}


#creating bucket
resource "google_storage_bucket" "demo-bucket"{
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


#creating dataset
resource "google_bigquery_dataset" "demo-dataset" {
  dataset_id = var.bq_dataset_name
#   project = "my-project"
    location = var.location
}