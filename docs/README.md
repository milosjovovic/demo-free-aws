# Demo Free AWS Infrastructure

Ovaj projekat demonstrira kako kreirati AWS infrastrukturu koristeći samo **Free Tier** resurse.

## 🆓 Free Tier resursi

- **EC2**: 750 sati t2.micro mesečno (12 meseci)
- **EBS**: 30GB General Purpose SSD storage
- **VPC**: Besplatno
- **Elastic IP**: 1 besplatna (dok je attached)
- **Data Transfer**: 15GB outbound mesečno

## 🚀 Deployment

1. **Generiši SSH ključ:**
   ```bash
   ./scripts/deployment/01-generate-ssh-key.sh
