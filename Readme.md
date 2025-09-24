Inkcut Docker Setup for Raspberry Pi
--
This project automates the setup of a Dockerized Inkcut and Filebrowser environment on a fresh Raspberry Pi running Raspberry Pi OS.

Quick Start
---
On a fresh Raspberry Pi, run the following command. This will download and execute the setup script, which handles everything for you.

    curl -sSL https://raw.githubusercontent.com/uppsala-makerspace/inkcut/main/setup.sh | sudo bash

this command can also be used to update both the raspberry pi and the docker image.

After this is done, the application can be reached on port 80 on the raspberry pi.

What This Does
---
The setup script performs the following actions:

1. Updates the System: Ensures all system packages are up-to-date. 
2. Installs Docker: Downloads and installs the latest version of Docker Engine. 
3. Pulls the Image: Fetches the latest multi-architecture inkcut image from the GitHub Container Registry. 
4. Creates a Service: Sets up a systemd service that:
   - Automatically starts the Docker container on boot. 
   - Restarts the container if it ever fails. 
   - Grants the container access to the Raspberry Pi's USB ports using --privileged mode. 
   - Exposes the web interface on the Raspberry Pi's port 80.

Updating to the latest image version
---
To update to the latest version from github, run

    curl -sSL https://raw.githubusercontent.com/uppsala-makerspace/inkcut/main/setup.sh | sudo bash

this is the same command used for first time installation and will also update the software on the pi itself.

N.B. This will overwrite any changes to the definition of the inkcut-docker service. This is probably what you want.

If you do not want to update the service definition or update the pi, run

   docker pull ghcr.io/uppsala-makerspace/inkcut:latest
   sudo systemctl restart inkcut-docker.service

Accessing the Application
---
Once the script is finished, you can access the services from any computer on the same network:

http://<your-pi-ip-address>

You can find your Raspberry Pi's IP address by running hostname -I on the Pi's terminal.

Managing the Service
---
Check Status: 

    sudo systemctl status inkcut-docker.service

View Logs:

    sudo docker logs -f inkcut-container

Stop Service:

    sudo systemctl stop inkcut-docker.service

Start Service:

    sudo systemctl start inkcut-docker.service