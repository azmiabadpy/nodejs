#!/bin/bash

# Exit immediately if any command fails

echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y
echo "Installing required packages..."
sudo apt install -y curl git
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

echo "Checking installed versions..."
node -v
npm -v
git --version

echo "Fetching source code from GitHub..."

cd /home/ubuntu

# Remove existing project if it exists
if [ -d "node_app" ]; then
    rm -rf node_app
fi

# Clone the repository
git clone https://https://github.com/azmiabadpy/nodejs.git node_app

# Move into the project directory
cd node_app
npm install

echo "Starting Node.js application..."

# Stop any existing Node.js process
pkill node || true

# Start the application in the background
nohup node app.js > app.log 2>&1 &

# Wait for the application to start
sleep 3
echo "Generating deployment logs: "

PID=$(pgrep -f "node app.js")

REPORT_FILE="deployment_report.txt"

{
echo "Date          : $(date)"
echo "Hostname      : $(hostname)"
echo "IP Address    : $(hostname -I)"
echo "Application   : node app.js"
echo "Process ID    : $PID"
echo "Node Version  : $(node -v)"
echo "NPM Version   : $(npm -v)"
echo
ps -fp "$PID"
echo

ps -p "$PID" -o pid,ppid,cmd,%cpu,%mem
echo

echo " DISK USAGE"
df -h
echo

echo "MEMORY"
free -h
echo

echo "PORT LISTENING"
ss -tulnp | grep "$PID"
echo

echo "APPLICATION LOG (Last 10 Lines)"
tail -10 app.log

} > "$REPORT_FILE"
echo "Deployment report saved as $REPORT_FILE"

