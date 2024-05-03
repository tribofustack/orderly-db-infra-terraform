resource "google_sql_database_instance" "instance" {
  name    = var.instance_name
  region  = var.region
  project = var.project_id

  database_version    = var.postgres_version
  deletion_protection = false

  settings {
    tier = var.machine_type
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        value = "0.0.0.0/0"
        name  = "open-access"
      }
    }
  }
  
  depends_on = [
    google_project_service.sqladmin,
    google_project_service.cloudresourcemanager,
    google_project_service.serviceusage
  ]
}

resource "google_sql_database" "checkin_database" {
  project    = var.project_id
  name       = "checkin"
  charset    = "utf8"
  instance   = google_sql_database_instance.instance.name
}

resource "google_sql_database" "checkout_database" {
  project    = var.project_id
  name       = "checkout"
  charset    = "utf8"
  instance   = google_sql_database_instance.instance.name
}

resource "google_sql_database" "financial_database" {
  project    = var.project_id
  name       = "financial"
  charset    = "utf8"
  instance   = google_sql_database_instance.instance.name
}

resource "google_sql_user" "checkin_user" {
  project    = var.project_id
  name       = var.checkin_db_username
  password   = var.checkin_db_pass
  instance   = google_sql_database_instance.instance.name
}

resource "google_sql_user" "checkout_user" {
  project    = var.project_id
  name       = var.checkout_db_username
  password   = var.checkout_db_pass
  instance   = google_sql_database_instance.instance.name
}

resource "google_sql_user" "financial_user" {
  project    = var.project_id
  name       = var.financial_db_username
  password   = var.financial_db_pass
  instance   = google_sql_database_instance.instance.name
}
