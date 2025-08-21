#!/bin/bash
# Deployment skripta za Free Tier demo

set -e

echo "🚀 Pokretanje Free Tier AWS deployment-a..."

# Prelazak u terraform direktorijum
cd infra/terraform

# Provera AWS credentials
echo "🔍 Provera AWS credentials..."
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "❌ AWS credentials nisu konfigurisani!"
    echo "Pokreni: aws configure"
    exit 1
fi

echo "✅ AWS credentials su validni"

# Terraform inicijalizacija
echo "🔧 Terraform inicijalizacija..."
terraform init

# Terraform validacija
echo "🔍 Validacija konfiguracije..."
terraform validate

# Terraform plan
echo "📋 Kreiranje execution plan-a..."
terraform plan -out=tfplan

# Potvrda za deployment
echo ""
echo "📊 Plan je kreiran. Da li želiš da primeniš promene?"
echo "Ovo će kreirati sledeće FREE TIER resurse:"
echo "  - 1x t2.micro EC2 instance"
echo "  - VPC sa javnim subnet-om"
echo "  - Security Group"
echo "  - Elastic IP"
echo "  - 8GB gp2 EBS volume"
echo ""
read -p "Nastavi sa deployment-om? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 Primenjujem promene..."
    terraform apply tfplan
    
    echo ""
    echo "✅ Deployment završen uspešno!"
    echo ""
    echo "📊 Informacije o infrastrukturi:"
    terraform output
    
    echo ""
    echo "🌐 Testiranje web sajta..."
    sleep 30  # Čekanje da se instance pokrene
    
    PUBLIC_IP=$(terraform output -raw instance_public_ip)
    echo "🔗 Web sajt: http://$PUBLIC_IP"
    echo "🔗 Server info: http://$PUBLIC_IP/info.html"
    
    echo ""
    echo "🔑 SSH pristup:"
    echo "ssh -i ~/.ssh/demo-free-key ec2-user@$PUBLIC_IP"
    
else
    echo "❌ Deployment otkazan"
    rm -f tfplan
fi
