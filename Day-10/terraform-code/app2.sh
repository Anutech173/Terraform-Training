#!/bin/bash
# EC2 User Data for Bala-Training Terraform Demo

# Install Apache
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd

# Create app directory
sudo mkdir -p /var/www/html/app

# Background image: High-res Terraform themed
IMAGE_URL="https://scalefactory.com/blog/2021/12/22/terraform-v1.1-the-journey-continues/tf11x.png"

# Create styled HTML page
sudo tee /var/www/html/app/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Bala-Training – Terraform EC2 Demo</title>
  <style>
    body {
      background-image: url('$IMAGE_URL');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      font-family: Arial, sans-serif;
      color: white;
      text-align: center;
      height: 100vh;
      margin: 0;
    }
    .container {
      background: rgba(0, 0, 0, 0.6);
      padding: 30px;
      border-radius: 12px;
      display: inline-block;
      position: relative;
      top: -50px; /* moves the block up */
    }
    h1 {
      font-size: 48px;
      margin-bottom: 10px;
    }
    p {
      font-size: 22px;
      margin: 8px 0;
    }
    .learners {
      margin-top: 20px;
      font-size: 18px;
      line-height: 1.6;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Welcome to Terraform-Training - By Bala - From Server-2</h1>
    <p>Terraform EC2 Demo | Version: V1</p>
    <div class="learners">
      🎓 <strong>Shoutout to our Amazing Learners:</strong><br>
      Sai Charan &nbsp;•&nbsp; Sai Sushma &nbsp;•&nbsp; Anu Teenu
    </div>
  </div>
</body>
</html>
EOF
