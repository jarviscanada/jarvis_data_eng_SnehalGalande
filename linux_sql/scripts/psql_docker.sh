#! /bin/sh

#########################################################################################################################
# Purpose     :  Implement a script to start/stop the psql container
# Usage       :  ./psql_docker.sh start|stop|create [db_username][db_password]
#                paramter 1: command 
#                paramter 2: database user name
#                paramter 3: database password
#########################################################################################################################

# Capture CLI arguments
cmd=$1
db_username=$2
db_password=$3

# Start docker
sudo systemctl status docker || sudo systemctl start docker

# Check container status
docker container inspect jrvs-psql
container_status=$?

# Switch case to handle create|stop|start options
case $cmd in 
  create)
  
  # Check if the container is already created
  if [ $container_status -eq 0 ]; then
     echo 'Container already exists'
     exit 1	
  fi

  # Check if numner of CLI arguments are correct in count.
  if [ $# -ne 3 ]; then
     echo 'Create requires username and password'
     exit 1
  fi
  
  # Create container
    docker volume create skeleton_pgdata
  # Start the container
    docker run skeleton_pgdata
    exit $?
  ;;

  start|stop) 
  # Check instance status; exit 1 if container has not been created
  if [ $container_status -eq 0 ]; then
     echo 'Container not created'
     exit 1
  fi	

  # Start or stop the container
    docker container $cmd jrvs-psql
    exit $?
  ;;	
  
  # For all other illegal case options
  *)
    echo 'Illegal command'
    echo 'Commands: start|stop|create'
    exit 1
  ;;
esac 
