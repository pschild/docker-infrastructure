#!/bin/bash

if [[ !($(which docker) && $(docker --version)) ]];
  then
    echo "No docker installation detected. Running from beginning..."

    echo "Change password..."
    passwd

    echo "Updating system..."
    sudo apt-get update
    sudo apt-get dist-upgrade -y

    echo "Installing docker..."
    curl -sSL https://get.docker.com | sh
    sudo usermod -aG docker pi

    echo "Done. Reboot (sudo reboot) to apply changes, then run this script again"

  else
    echo "docker installation detected. Script will now continue..."

    echo "Installing docker-compose..."
    sudo apt install python3-pip -y
    sudo pip3 install docker-compose

    echo "Installing git..."
    sudo apt install git -y
    git config --global user.email "philippe.schild@googlemail.com"
    git config --global user.name "pschild"

    echo "Preparing smart-home environment..."
    cd ~
    mkdir smart-home
    cd smart-home
    git clone https://github.com/pschild/docker-infrastructure
    mkdir services && cd services
    git clone https://github.com/pschild/esp-update-server
    git clone https://github.com/pschild/esp-pir-manager
    git clone https://github.com/pschild/esp-mqtt-broker
    git clone https://github.com/pschild/alexa-connector
    git clone https://github.com/pschild/adesso-commuter-server
    git clone https://github.com/pschild/adesso-commuter-web

    echo "Starting services..."
    cd ../docker-infrastructure
    sudo docker-compose up -d

fi