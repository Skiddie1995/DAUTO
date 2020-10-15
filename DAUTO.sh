#!/bin/bash
#################################
#Just an easy Docker Automation##
#################################
#Made with love by Skiddie#######
#################################

######FUNCTIONS##############################################################################################

#Function to update the system with the docker repository and some dependencies
update_system()
{
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
  apt install -y docker-ce docker-compose
}

#Function to create the docker-compose YML file
write_dcompose()
{
#  if [ -e ./docker-compose.yml ]
#  then
#    rm -f ./docker-compose.yml
#    write_dcompose
#  else
#  echo "" > ./docker-compose.yml
#  fi
echo $elnodes
}
############################################################################################################

###MAIN###

###Update
if [ "$1" == "-u" ]
then
  update_system

####Load Docker Compose file
elif [ "$1" == "-f" ]
then
  echo teste


####Delk option - Docker, ElasticSearch Kibana automation
elif [ "$1" == "-delk" ]
then
  if [ -z "$2" ]
  then
    echo "You must inform the number of ElastiSearch nodes you want"
  else
  elnodes=$2
  write_dcompose
  fi

###No user input
else
  echo error
  exit 1
fi
