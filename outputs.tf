output "db_info" {
  value = {
    public_ip_address = google_sql_database_instance.instance.public_ip_address
    database          = google_sql_database.database.name
    user              = google_sql_user.user.name
    password          = google_sql_user.user.password
    sensitive         = true
  }
}