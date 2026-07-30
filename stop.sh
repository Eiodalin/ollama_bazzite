#!/bin/bash

AMD_DEVICE="/dev/kfd"

if [ -e "$AMD_DEVICE" ]; then
    ansible-playbook ./amd/stop_cfg.yaml -K
    COMPOSE_FILE="amd/docker-compose.yaml"
elif command -v nvidia-smi &> /dev/null; then
    ansible-playbook ./nvidia/stop_cfg.yaml -K
    COMPOSE_FILE="nvidia/docker-compose.yaml"
else
    echo "Failure: No supported AMD ($AMD_DEVICE) or Nvidia (nvidia-smi) GPU was detected."
    exit 1
fi

podman compose -f "$COMPOSE_FILE" --project-directory . down


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

The container should not be shown, if it still is there something has gone wrong.

EOF
