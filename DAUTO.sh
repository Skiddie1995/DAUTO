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
  apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common html-xml-utils


  #Adding the Docker repo GPG keys
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

  #Adding the Docker repo to your system
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

  #Updating yet once again
  apt update -y

  #Installing the community version of Docker
  apt install -y docker-ce docker-compose
  
  #Change memory map count to allow docker execution of multiple hosts
  sysctl -w vm.max_map_count=262144
}

#Function to create the docker-compose YML file
write_dcompose()
{
	echo -e "version: '$version'\nservices:\n\t"
}
#Function to download Elastic images (This function should be used to download all images on the future... I think)
download_images_elastic()
{
	image=$(curl -s https://www.docker.elastic.co/r/elasticsearch | hxnormalize -x | grep "docker pull"| tr -d '"' | awk '{print $3}' | grep amd | sed -n 2p)
	docker pull $image
}
#################END OF FUNTIONS###################################################################################

###MAIN IF###

###Update
if [ "$1" == "-u" ]
then
  update_system

####Load Docker Compose file
elif [ "$1" == "-f" ]
then
  if [ -z $2 ]
  then
    echo "You must inform your YML path after the -f option"
    exit 2
  else
    docker-compose up -f $2
    fi


####Delk option - Docker, ElasticSearch Kibana automation
elif [ "$1" == "-delk" ]
then
  if [ -z "$2" ]
  then
    echo "You must inform the number of ElastiSearch nodes you want"
  else
  elnodes=$2
  update_system
  download_images_elastic
  write_dcompose
  fi

###No user input
else
  echo "This script requires certain parameters"
  exit 1 ## Exit 1 is a no user input error
fi
### END OF MAIN IF###
