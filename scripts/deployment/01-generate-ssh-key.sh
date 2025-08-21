#!/bin/bash
# Generisanje SSH ključa za demo

echo "🔑 Generisanje SSH ključa..."

# Kreiranje .ssh direktorijuma ako ne postoji
mkdir -p ~/.ssh

# Generisanje SSH ključa
if [ ! -f ~/.ssh/demo-free-key ]; then
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/demo-free-key -N "" -C "demo-free-aws-key"
    echo "✅ SSH ključ kreiran: ~/.ssh/demo-free-key"
else
    echo "ℹ️  SSH ključ već postoji: ~/.ssh/demo-free-key"
fi

# Postavljanje permisija
chmod 600 ~/.ssh/demo-free-key
chmod 644 ~/.ssh/demo-free-key.pub

echo "🔑 SSH ključ spreman za korišćenje!"

chmod +x scripts/deployment/01-generate-ssh-key.sh
