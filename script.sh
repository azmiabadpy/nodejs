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
