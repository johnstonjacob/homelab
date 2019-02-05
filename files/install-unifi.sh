wget https://get.glennr.nl/unifi/5.9.29/U1804/unifi-5.9.29.sh -O install-unifi.sh
chmod +x install-unifi.sh

sudo useradd --system --home /home/unifi --shell /bin/false unifi
