#!/bin/bash
# this script installs the public key for the user to allow secure ssh
# the script can also be run to install a new key
# /etc/ssh/sshd_config is also updated to restrict logins
#
D=	# set to echo for debug w/o executing the script
USR=pi  # this should be set to the user name

USRHOME=/home/$USR
$D sudo cp sshd_config /etc/ssh  	# update sshd config file

if  [ -d "$USRHOME/.ssh" ] 
then
   $D sudo rm -rf $USRHOME/.ssh               # remove if exists to clear out any history
fi

# make the .ssh dir, copy the public key to .ssh, set owner/group
# set modes to protect the files (600,700) from being overwritten by malicious user.
#
$D sudo mkdir $USRHOME/.ssh		
$D sudo cp authorized_keys $USRHOME/.ssh	
$D sudo chown $USR $USRHOME/.ssh $USRHOME/.ssh/authorized_keys
$D sudo chgrp $USR $USRHOME/.ssh $USRHOME/.ssh/authorized_keys
$D sudo chmod 600 $USRHOME/.ssh/authorized_keys	
$D sudo chmod 700 $USRHOME/.ssh		
