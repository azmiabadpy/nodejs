# 🚀 Automated Node.js Application Deployment on AWS EC2

## 📌 Project Overview

This project demonstrates an automated deployment workflow for a **Node.js application on an AWS EC2 instance** using a Bash deployment script.

The script automates the complete setup process including system updates, Node.js installation, application deployment from GitHub, dependency installation, application startup, and generation of a deployment health report.

This project showcases DevOps practices such as **automation, Linux administration, application deployment, and monitoring**.

---

# 🏗️ Architecture

```
                 Developer

                    |
                    |
              GitHub Repository

                    |
                    |
              Deployment Script

                    |
                    |

              AWS EC2 Instance

                    |
       --------------------------------

       Install Node.js Environment

                    |

          Clone Application Code

                    |

              npm install

                    |

            Start Node.js App

                    |

        Generate Deployment Report

```

---

# 🛠️ Technologies Used

## Cloud

- AWS EC2


## Application

- Node.js
- Express.js


## DevOps Tools

- Linux Bash Script
- Git
- npm


## Monitoring

- Linux Process Monitoring
- Disk Monitoring
- Memory Monitoring
- Network Port Monitoring
- Application Logs


---

# 📂 Project Structure

```
nodejs-deployment/

│
├── app.js
│
├── package.json
│
├── script.sh
│
└── README.md

```

---

# 🚀 Application Deployment Workflow

The deployment script performs the following tasks:

```
Start Script

     |
     |
Update System Packages

     |
     |
Install curl and git

     |
     |
Install Node.js 22

     |
     |
Clone GitHub Repository

     |
     |
Install npm Dependencies

     |
     |
Stop Existing Node Process

     |
     |
Start Node.js Application

     |
     |
Generate Deployment Report

```

---

# ⚙️ Deployment Script Features

## 1. System Package Update

Updates Ubuntu packages:

```bash
sudo apt update -y
sudo apt upgrade -y
```

---

## 2. Install Required Packages

Installs:

- curl
- git

```bash
sudo apt install -y curl git
```

---

## 3. Install Node.js

The script installs Node.js version 22:

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

sudo apt install -y nodejs
```

Verify installation:

```bash
node -v
npm -v
```

---

## 4. Clone Application From GitHub

The script automatically downloads application source code:

```bash
git clone https://github.com/azmiabadpy/nodejs.git node_app
```

---

## 5. Install Dependencies

Inside the application directory:

```bash
npm install
```

---

## 6. Start Node.js Application

Stops old Node.js processes:

```bash
pkill node || true
```

Starts the application:

```bash
nohup node app.js > app.log 2>&1 &
```

Explanation:

| Command | Purpose |
|-|-|
| nohup | Keeps application running after logout |
| > app.log | Saves application output |
| 2>&1 | Redirects errors to same log file |
| & | Runs process in background |

---

# 📊 Deployment Monitoring Report

After deployment, the script creates:

```
deployment_report.txt
```

The report contains:

## System Information

```
Date
Hostname
IP Address
Application Name
Process ID
Node Version
NPM Version
```

---

## Process Details

Example:

```
PID
PPID
CPU Usage
Memory Usage
```

Command used:

```bash
ps -p PID -o pid,ppid,cmd,%cpu,%mem
```

---

## Disk Monitoring

Checks disk utilization:

```bash
df -h
```

Example:

```
Filesystem
Size
Used
Available
Use%
```

---

## Memory Monitoring

Checks RAM usage:

```bash
free -h
```

---

## Application Port Monitoring

Checks active listening ports:

```bash
ss -tulnp
```

---

## Application Logs

Displays latest application logs:

```bash
tail -10 app.log
```

---

# ▶️ How To Run

## Clone Repository

```bash
git clone https://github.com/<username>/nodejs-deployment.git

cd nodejs-deployment
```

---

## Give Script Permission

```bash
chmod +x script.sh
```

---

## Execute Deployment Script

```bash
./script.sh
```

---

# 🌐 Access Application

After deployment:

```
http://<EC2-Public-IP>:3000
```

---

# 🔍 Verify Deployment

Check running Node.js process:

```bash
ps -ef | grep node
```

Check application port:

```bash
ss -tulnp | grep 3000
```

Check logs:

```bash
cat app.log
```

---

# 🔐 Security Configuration

Required AWS EC2 Security Group rule:

| Type | Port | Source |
|-|-|-|
| SSH | 22 | Your IP |
| HTTP | 3000 | Required Users |

---

# 📚 Learning Outcomes

This project demonstrates:

✅ Automating application deployment using Bash  
✅ Installing runtime dependencies automatically  
✅ Deploying Node.js applications on AWS EC2  
✅ Linux process management  
✅ Background application execution using nohup  
✅ Application logging  
✅ Server health monitoring  
✅ Git-based deployment workflow  


---

# 🔮 Future Improvements

Possible enhancements:

- Create Jenkins CI/CD pipeline
- Use Docker containerization
- Deploy using Kubernetes
- Add AWS CloudWatch monitoring
- Use Systemd service instead of nohup
- Add Terraform EC2 provisioning
- Add Ansible configuration management


---

# 👨‍💻 Author

**Abadur Rahaman Azmi**

DevOps Engineer

## Skills

AWS | Linux | Docker | Kubernetes | Jenkins | Terraform | Bash | Node.js | CI/CD
