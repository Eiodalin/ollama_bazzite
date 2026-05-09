#!/bin/bash

brew install ansible
ansible-playbook start_cfg.yaml -K
cat  << EOF
The BECOME password is your sudo password.
Make sure you know what you are running here before typing a password.

ANY commands run with sudo passwords should be contemplated.
EOF
podman compose up -d


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
