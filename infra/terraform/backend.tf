# Backend konfiguracija - lokalni state za demo
terraform {
  required_version = ">= 1.5"
  
  # Za demo koristimo lokalni backend (besplatno)
  # backend "local" {
  #   path = "terraform.tfstate"
  # }
}
