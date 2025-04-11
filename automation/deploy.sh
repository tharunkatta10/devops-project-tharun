cat <<EOF > deploy.sh
#!/bin/bash
cd ~/devops-project-tharun/automation
git pull origin main
npm install
pm2 restart auto-app || pm2 start app.js --name auto-app
EOF

chmod +x deploy.sh
