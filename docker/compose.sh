export USERID=$(id -u)
export GROUPID=$(id -g)
export USERNAME=$(whoami)
export CONTAINERNAME="qvit_deit_2210"
printf "USERID=%s\n" $USERID 
printf "GROUPID=%s\n" $GROUPID
printf "USERNAME=%s\n" $USERNAME 
xhost +
#docker-compose up -d --force-recreate --no-deps --build
docker rm -f ${CONTAINERNAME}

docker-compose up -d --build
docker exec -it ${CONTAINERNAME} /bin/bash
