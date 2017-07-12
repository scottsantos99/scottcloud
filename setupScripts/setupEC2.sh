#!/bin/bash

echo -e setting server connection variables...
serviceDNS=ec2-52-14-242-157.us-east-2.compute.amazonaws.com
dbDNS=ec2-52-14-217-74.us-east-2.compute.amazonaws.com
webDNS=ec2-18-220-16-150.us-east-2.compute.amazonaws.com
ec2User=ec2-user
pathToPemFile=..
servicePemFileName=sevenseconddelay_db2.pem
dbPemFileName=sevenseconddelay_actualDb.pem
webPemFileName=sevenseconddelay.pem
sshConnectionCommandForService="ssh -tt -i $pathToPemFile/$servicePemFileName $ec2User@$serviceDNS 'bash -s'"
sshConnectionCommandForDb="ssh -tt -i $pathToPemFile/$dbPemFileName $ec2User@$dbDNS 'bash -s'"
sshConnectionCommandForWebServer="ssh -tt -i $pathToPemFile/$webPemFileName $ec2User@$webDNS 'bash -s'"
scpConnectionCommandForWebServer="scp -i $pathToPemFile/$webPemFileName ^pathAndFileToCopy $ec2User@$webDNS:~"

echo -e "\n\nStarting website build..."
xterm -e ./buildWebserverCode.sh &

echo -e "\n\nStopping db using:\n $sshConnectionCommandForDb"
xterm -e "$sshConnectionCommandForDb < ./stopDbScript.sh" &
sleep 5

echo -e "\n\nStarting db using:\n $sshConnectionCommandForDb"
nohup xterm -e "$sshConnectionCommandForDb < ./startDbScript.sh" &
sleep 5

echo -e "\n\nRemoving and adding db user"
xterm -e "$sshConnectionCommandForDb < ./removeAddUserDbScript.sh" &
sleep 5

echo -e "\n\nCreating data"
nohup xterm -e "$sshConnectionCommandForDb < ./createDataDbScript.sh" &
sleep 5

echo -e "\n\nSetup service server"
nohup xterm -e "./setupService.sh \"$sshConnectionCommandForService\"" &

echo -e "\n\nSetup web server"
xterm -e ./setupWebserver.sh "$sshConnectionCommandForWebServer" "$scpConnectionCommandForWebServer" &
sleep 25

echo -e "\n\nTest service is running..."
./testService.sh "$serviceDNS"