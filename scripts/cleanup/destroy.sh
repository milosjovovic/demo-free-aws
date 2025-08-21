#!/bin/bash
# Cleanup skripta za brisanje svih resursa

set -e

echo "🗑️  Brisanje Free Tier AWS resursa..."

cd infra/terraform

echo "⚠️  PAŽNJA: Ovo će obrisati sve kreirane AWS resurse!"
echo "Resursi koji će biti obrisani:"
echo "  - EC2 instance"
echo "  - Elastic IP"
echo "  - Security Group"
echo "  - VPC i networking komponente"
echo ""

read -p "Da li si siguran da želiš da obrišeš sve resurse? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🗑️  Brisanje resursa..."
    terraform destroy -auto-approve
    
    echo "✅ Svi resursi su uspešno obrisani!"
    echo "💰 Troškovi su zaustavljeni"
else
    echo "❌ Brisanje otkazano"
fi
