This is the **manual deployment** version of the Node.js application, created as part of the DevOps project assignment.

## 🔧 Overview

- This app is a basic Node.js server using Express
- It runs on **EC2 (Ubuntu)** instance
- Managed using **PM2** process manager
- Deployment and service are handled **manually**

---

## 📁 Directory Structure

```
manual/
├── app.js
├── package.json
├── deploy.sh
└── README.md
```

---

## 🚀 How to Run Manually

1. **SSH into EC2 instance**  
2. Navigate to the project directory  
3. Install dependencies:

```bash
npm install
```

4. Start the app using PM2:

```bash
pm2 start app.js --name manual-app
```

5. App runs on port **3000** (or specified in `app.js`)

---

## ✅ Deployment Checklist

- [x] Node.js and PM2 installed
- [x] Git repo initialized and connected
- [x] App running and accessible from public IP
- [x] Proper branching and README documentation

---

## 👨‍💻 Author

**Tharun Katta**  
GitHub: [tharunkatta10](https://github.com/tharunkatta10)
