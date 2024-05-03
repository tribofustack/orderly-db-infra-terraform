output "db_info_checkin" {
  value = {
    public_ip_address = google_sql_database_instance.instance.public_ip_address
    database = google_sql_database.checkin_database.name
    user     = google_sql_user.checkin_user.name
    password = var.checkin_db_pass
  }
  sensitive = true
}

output "db_info_checkout" {
  value = {
    public_ip_address = google_sql_database_instance.instance.public_ip_address
    database = google_sql_database.checkout_database.name
    user     = google_sql_user.checkout_user.name
    password = var.checkout_db_pass
  }
  sensitive = true
}

output "db_info_financial" {
  value = {
    public_ip_address = google_sql_database_instance.instance.public_ip_address
    database = google_sql_database.financial_database.name
    user     = google_sql_user.financial_user.name
    password = var.financial_db_pass
  }
  sensitive = true
}
