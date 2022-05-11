#!/bin/shell
echo "Clonning backend repository..."
git clone https://github.com/KB-AIS/passman-back
echo "Clonning frontend repository..."
git clone https://github.com/KB-AIS/passman-web
echo "Pulling changes..."
cd passman-back
git pull
cd ../passman-web
git pull
cd ../
echo "Copy appsettins..."
cp appsettings.*.json ./passman-back/passman-back
mkdir RSA
cp -r RSA ./passman-back/passman-back/RSA
echo "Delete old passman docker images..."
docker rmi passman_backend passman_frontend
echo "Docker-compose up..."
docker-compose up