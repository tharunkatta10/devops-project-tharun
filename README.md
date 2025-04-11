# DevOps Git-Based Project - Node.js App Deployment (Manual & Automated)

This project demonstrates two deployment strategies for a simple Node.js application hosted on an AWS EC2 instance:

- ✅ **Manual Deployment using Git, PM2, and SSH**
- ⚙️ **Automated CI/CD Pipeline using GitHub Actions**

---

## 🔧 Project Overview

- Node.js app deployed to an EC2 instance.
- Managed by PM2 for production process control.
- Manual and Automated Git-based deployment.
- CI/CD integration with GitHub Actions.

---

## 🛠️ Manual Deployment Instructions

### 1. SSH into EC2
```bash
ssh -i <your-key.pem> deployuser@<your-ec2-public-ip>
```

### 2. Clone the Repository
```bash
git clone https://github.com/tharunkatta10/devops-project-tharun.git
cd devops-project-tharun
```

### 3. Install Dependencies
```bash
npm install
```

### 4. Start the Application using PM2
```bash
pm2 start index.js --name devops-app
pm2 save
pm2 startup
```

### 5. Check Logs
```bash
pm2 logs devops-app
```

---

## 🤖 Automated CI/CD Deployment (GitHub Actions)

### Trigger

- Deployment is automatically triggered on every push to the `main` branch.

### GitHub Workflow File: `.github/workflows/deploy.yml`

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:

      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up SSH
        uses: webfactory/ssh-agent@v0.5.4
        with:
          ssh-private-key: ${{ secrets.EC2_SSH_KEY }}

      - name: Deploy Application
        run: |
          ssh -o StrictHostKeyChecking=no deployuser@184.72.196.136 << 'EOF'
            cd devops-project-tharun
            git pull origin main
            npm install
            pm2 restart devops-app || pm2 start index.js --name devops-app
          EOF
```

> Make sure you’ve added your EC2 private key as `EC2_SSH_KEY` in the GitHub repository’s Secrets section.

---

## 📡 Verify App is Running

```bash
curl http://localhost:3000
```

Or open in your browser:
```
http://<your-ec2-public-ip>:3000
```

---

## ✅ Summary

| Feature                    | Status     |
|----------------------------|------------|
| Manual Deployment         | ✅ Working |
| PM2 Process Management    | ✅ Working |
| GitHub Actions CI/CD      | ✅ Working |
| EC2 App Health Check      | ✅ Running |

---

## ✍️ Author

**Tharun Katta**  
GitHub: [@tharunkatta10](https://github.com/tharunkatta10)
