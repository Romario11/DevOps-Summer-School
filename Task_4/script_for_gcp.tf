terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("credentials-gcp.json")
  project = "credible-mode-318514"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "apache-srv-tf"
  machine_type = "e2-small"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210720"
    }
  }

 
  network_interface {
    network = "default"
    access_config {
    }
  }
  tags = ["http-server", "https-server"]


  metadata_startup_script =  file("apache.sh")
  metadata = {
    ssh-keys = "romario:${file("gcp-key")}"
  }
}