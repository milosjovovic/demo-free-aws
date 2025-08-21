# demo-free-aws

Demo project to deploy a Free Tier EC2 (t2.micro) with Terraform + user-data.
Folders:
- infra/terraform — Terraform config
- config/ansible
- k8s
- scripts (deployment / cleanup)
- docs

Usage:
1. Generate SSH key: ./scripts/deployment/01-generate-ssh-key.sh
2. Deploy: ./scripts/deployment/02-deploy.sh
3. Destroy: ./scripts/cleanup/destroy.sh

Do not commit AWS credentials, private keys or terraform state.
