#!/bin/bash

# check the model (ubuntu, fedora, etc) and download apache2/httpd dependency

# assume fedora
PACKAGE="httpd"
echo "trying yum install"
echo
echo

#try a sample fedora command and nullify the output
sudo yum install wget -y &> /dev/null

# check the status code of the last command
if [ $? -eq 0 ]
        then
                echo "fedora/centos system."
                sleep 1
                echo "installing httpd"
                sudo yum install $PACKAGE -y &> /dev/null
                echo "done indtalling httpd"
                systemctl status httpd
        else
                echo "ubuntu system"
                echo "installing apache2"
                PACKAGE="apache2"
                sudo apt install $PACKAGE -y &> /dev/null
                echo "done installing apache2"
                systemctl status apache2
fi