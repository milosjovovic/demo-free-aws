# Input varijable za Free Tier demo
variable "project_name" {
  description = "Naziv projekta"
  type        = string
  default     = "demo-free"
}

variable "environment" {
  description = "Okruženje"
  type        = string
  default     = "demo"
}

variable "owner" {
  description = "Vlasnik resursa"
  type        = string
  default     = "demo-user"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

# VPC konfiguracija
variable "vpc_cidr" {
  description = "CIDR blok za VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR blok za javni subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# EC2 konfiguracija (Free Tier eligible)
variable "instance_type" {
  description = "Instance tip (Free Tier)"
  type        = string
  default     = "t2.micro"  # 750 sati mesečno besplatno
}

variable "root_volume_size" {
  description = "Veličina root volume-a u GB (Free Tier: 30GB)"
  type        = number
  default     = 8  # Koristimo samo 8GB da budemo sigurni
}

# SSH ključ
variable "ssh_public_key_path" {
  description = "Putanja do javnog SSH ključa"
  type        = string
  default     = "~/.ssh/demo-free-key.pub"
}
