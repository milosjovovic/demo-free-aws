#!/bin/bash
# User data script za osnovnu konfiguraciju instance-a

# Ažuriranje sistema
yum update -y

# Instaliranje osnovnih paketa
yum install -y httpd git htop

# Postavljanje hostname-a (Terraform zamenjuje ${hostname})
hostnamectl set-hostname ${hostname}

# Kreiranje osnovne web stranice
cat > /var/www/html/index.html << 'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>Demo Free AWS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { background: #232f3e; color: white; padding: 20px; border-radius: 5px; }
        .content { padding: 20px; background: #f5f5f5; border-radius: 5px; margin-top: 20px; }
        .status { background: #d4edda; padding: 10px; border-radius: 5px; margin: 10px 0; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🚀 Demo Free AWS Infrastructure</h1>
            <p>Uspešno pokrenuto na AWS Free Tier!</p>
        </div>
        <div class="content">
            <div class="status">
                <strong>Status:</strong> ✅ Server je aktivan
            </div>
            <h2>Informacije o serveru:</h2>
            <ul>
                <li><strong>Hostname:</strong> ${hostname}</li>
                <li><strong>Instance Type:</strong> t2.micro (Free Tier)</li>
                <li><strong>Region:</strong> eu-central-1</li>
                <li><strong>Datum kreiranja:</strong> $(date)</li>
            </ul>
            <h2>Free Tier resursi:</h2>
            <ul>
                <li>✅ EC2 t2.micro instance (750 sati mesečno)</li>
                <li>✅ 30GB EBS storage</li>
                <li>✅ VPC i networking komponente</li>
                <li>✅ Elastic IP adresa</li>
            </ul>
        </div>
    </div>
</body>
</html>
HTML

# Pokretanje Apache servisa
systemctl start httpd
systemctl enable httpd

# Kreiranje info stranice (bash komande se izvršavaju na instanci)
cat > /var/www/html/info.html <<HTML
<!DOCTYPE html>
<html>
<head><title>Server Info</title></head>
<body>
    <h1>Server Information</h1>
    <pre>$(cat /etc/os-release)</pre>
    <h2>System Info</h2>
    <pre>$(uname -a)</pre>
    <h2>Memory Info</h2>
    <pre>$(free -h)</pre>
    <h2>Disk Info</h2>
    <pre>$(df -h)</pre>
</body>
</html>
HTML

echo "User data script completed successfully at $(date)" > /var/log/user-data.log
