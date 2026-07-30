#!/bin/bash

AMD_DEVICE="/dev/kfd"

if [ -e "$AMD_DEVICE" ]; then
    echo "Success: The device node '$AMD_DEVICE' exists."
    ansible-playbook ./amd/start_cfg.yaml -K
    COMPOSE_FILE="amd/docker-compose.yaml"
elif command -v nvidia-smi &> /dev/null; then
    echo "Success: nvidia-smi found, Nvidia GPU detected."
    ansible-playbook ./nvidia/start_cfg.yaml -K
    COMPOSE_FILE="nvidia/docker-compose.yaml"
else
    echo "Failure: No supported AMD ($AMD_DEVICE) or Nvidia (nvidia-smi) GPU was detected."
    exit 1
fi

cat  << EOF
The BECOME password is your sudo password.
Make sure you know what you are running here before typing a password.

ANY commands run with sudo passwords should be contemplated.
EOF
podman compose -f "$COMPOSE_FILE" --project-directory . up -d


cat << EOF

     %%%%%%====%%%%%%%%%%
   %%%%%%%%    %%%%%%%%%%%%%%
  %%%%%%%%%    %%%%%%%%%%%%%%%%
  %%%%%%%%%    %%%%%%%%%%%%%%%###
  %%%%%%%%%    %%%%%%%%%%%%%######
  ==                  =======######
  ==                  =========#####
  %%%%%%%%%    %%%%%%%####======#####
  %%%%%%%%%    %%%%%#######=====#####
  %%%%%%%%%    %%%#########=====#####
  %%%%%%%%%    %%##########=====#####
  %%%%%%%%%====###########=====######
   %%%%%%%%====#########======######
    %%%%%%%=====#####========######
     %%%%###===============#######
      %#######==========#########
        #######################
          ###################
              ###########

You should be able to see the container up with podman ps,if not something has gone wrong.
EOF
podman ps
