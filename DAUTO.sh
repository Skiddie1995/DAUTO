#!/bin/bash
##############################
#Just an easy DELK config (:##
##############################
#Made with love by Skiddie####
##############################


# Update thy system
apt update -y

#Simple error check
###PLEASE IMPLEMENT ME

# Installing a bunch of useful shit
apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common


#Adding the Docker repo GPG keys
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

#Adding the Docker repo to your system
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

#Updating yet once again
apt update -y

#Installing the community version of Docker
apt install -y docker-ce
