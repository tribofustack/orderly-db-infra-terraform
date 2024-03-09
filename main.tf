provider "google" {
  credentials = file("postech-415418-1cc45ad2638e.json")
  project     = "postech-415418"
  region      = "us-central1"
  zone        = "us-central1-c"
}

terraform {
  backend "gcs" {
    bucket = "popostech"
    prefix = "terraform/db"
  }
}

resource "google_sql_database_instance" "instance" {
  name             = "postgres"
  region           = "us-central1"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        value = "0.0.0.0/0"
        name  = "open-access"
      }
    }
  }

  deletion_protection = "false"
}

resource "google_sql_user" "user" {
  name     = "postgres"
  instance = google_sql_database_instance.instance.name
  password = "postgres"
}

output "db_instance_ip" {
  value       = google_sql_database_instance.instance.ip_address[0].ip_address
  description = "The public IP address of the database instance."
}
