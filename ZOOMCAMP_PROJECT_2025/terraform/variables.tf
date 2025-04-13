

variable "credentials" {
    description = "My Credentials"
    default="./keys/terraformgcpkeys.json"
}



variable "project" {
    description = "Project name"
    default="loyal-karma-456615-j3"
}


variable "region" {
    description = "Project region"
    default="us-central1"
}


variable "location" {
    description = "Project location"
    default="US"
}


variable "bq_dataset_name" {
    description="My BigQuey Dataset Name"
    default = "econ_datawh"
}


variable "gcs_bucket_name" {
    description="My Data lake Storage Bucket Name"
    default="econ_datalake"
}

variable "gcs_storage_class" {
    description="Bucket Storage Class"
    default="STANDARD"
}