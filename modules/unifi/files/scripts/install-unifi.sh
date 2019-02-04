echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
sudo apt-get -y update
sudo apt-get -y install unifi
