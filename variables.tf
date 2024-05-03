variable "project_id" {}

variable "zone" {}

variable "region" {}

variable "instance_name" {}

variable "postgres_version" {
  default = "POSTGRES_14"
}

variable "machine_type" {
  default = "db-f1-micro"
}

variable "checkin_db_username" {
  default = "postgres"
}

variable "checkin_db_pass" {
  default = "postgres"
  sensitive = true
}

variable "checkout_db_username" {
  default = "postgres"
}

variable "checkout_db_pass" {
  default = "postgres"
  sensitive = true
}

variable "financial_db_username" {
  default = "postgres"
}

variable "financial_db_pass" {
  default = "postgres"
  sensitive = true
}
