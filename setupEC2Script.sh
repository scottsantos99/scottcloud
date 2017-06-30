#!/bin/bash

echo -e setting server connection variables...
serviceDNS=ec2-13-58-245-77.us-east-2.compute.amazonaws.com
dbDNS=ec2-13-59-233-36.us-east-2.compute.amazonaws.com
ec2User=ec2-user
pathToPemFile=..
servicePemFileName=sevenseconddelay_db2.pem
dbPemFileName=sevenseconddelay_actualDb.pem
sshConnectionCommandForService="ssh -tt -i $pathToPemFile/$servicePemFileName $ec2User@$serviceDNS 'bash -s'"
sshConnectionCommandForDb="ssh -tt -i $pathToPemFile/$dbPemFileName $ec2User@$dbDNS 'bash -s'"

echo -e "\n\nSetup service server"
./setupService.sh "$sshConnectionCommandForService"
#nohup xterm -e "$sshConnectionCommandForService < ./pullNewAppJsToService.sh" &


echo -e "\n\nStopping db using:\n $sshConnectionCommandForDb"
#nohup xterm -e "$sshConnectionCommandForDb < ./stopDbScript.sh" &
sleep 5

echo -e "\n\nStarting db using:\n $sshConnectionCommandForDb"
#nohup xterm -e "$sshConnectionCommandForDb < ./startDbScript.sh" &
sleep 5

echo -e "\n\nRemoving and adding db user"
#nohup xterm -e "$sshConnectionCommandForDb < ./removeAddUserDbScript.sh" &
sleep 5

echo -e "\n\nCreating data"
#nohup xterm -e "$sshConnectionCommandForDb < ./createDataDbScript.sh" &
