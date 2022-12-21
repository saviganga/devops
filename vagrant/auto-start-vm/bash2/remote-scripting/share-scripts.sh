#!/bin/bash

# get all remote hosts
for HOST in $(cat ./remote-hosts.txt)
    do

        # print the remote host 
        echo "#######################################################"
        echo $HOST
        echo

        # push the installation file to the remote host and execute
        scp ./server-install.sh devops@$HOST:/tmp/

        # log into the remote system and run command
        ssh devops@$HOST /tmp/server-install.sh

        
        echo "done $HOST"
        echo
        echo "#######################################################"
done    
        