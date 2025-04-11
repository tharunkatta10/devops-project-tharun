cat <<EOF > deploy.sh
#!/bin/bash
cd ~/devops-project-tharun/manual
git pull origin main
npm install
pm2 restart manual-app || pm2 start app.js --name manual-app
EOF

chmod +x deploy.sh
