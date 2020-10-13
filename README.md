# docker-infrastructure

This repo helps to set up the infrastructure for running Smart Home services.  
The included `docker-compose.yml` builds/starts the following containers:
 - (**registry**: Local registry for private docker images, based on [registry](https://hub.docker.com/_/registry))
 - (**watchtower**: Service to automatically watch for newer versions of images, based on [containrrr/watchtower](https://hub.docker.com/r/containrrr/watchtower))
 - (**jenkins**: CI/CD Tool, based on [jenkins4eval/jenkins](https://hub.docker.com/r/jenkins4eval/jenkins), see `jenkins/Dockerfile`)
 - **ESP services**:
   - [esp-pir-manager](https://github.com/pschild/esp-pir-manager)
   - [esp-update-server](https://github.com/pschild/esp-update-server)
   - [esp-mqtt-broker](https://github.com/pschild/esp-mqtt-broker)
   - [adesso-commuter-server](https://github.com/pschild/adesso-commuter-server)
   - tbc

## How to use

Use the script `install-smart-home.sh` to setup everything from scratch (after a fresh installation of Raspbian).  
Call the script and follow the instructions. The script will
  - ensure that you change your password after fresh installation,
  - update your system packages,
  - install docker, docker-compose (+ dependencies), git (+ config),
  - create the necessary folder structure,
  - clone necessary repositories
  - and finally run the services.

Alternatively, you can do it manually:

1. Clone this repository
2. Ensure that your node services are located in `../services`. The structure could look like this:
  - smart-home/
    - docker-infrastructure/ (this repo)
    - services/
      - esp-pir-manager/
      - esp-update-server/
      - ...

    If you want to change this structure, adjust the paths in `docker-compose.yml` pointing to the node services.

3. Run `docker-compose up -d` and wait for the containers being started
4. Run `docker-compose up -d --no-deps --build <SERVICES>` to update a service after pulling the latest files from git.
