resource "google_secret_manager_secret" "backend_url" {
  secret_id = "backend-url"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "backend_url_value" {
  secret      = google_secret_manager_secret.backend_url.id
  secret_data = "https://backend-url-placeholder"
}

