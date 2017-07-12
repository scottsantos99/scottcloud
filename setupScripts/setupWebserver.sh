#!/bin/bash

scpConnectionCommand="$2"
path='../webserver/dist.tar.gz'
scpConnectionCommand="${scpConnectionCommand/^pathAndFileToCopy/$path}"

echo -e "\n\nConnecting to webserver using $scpConnectionCommand"
xterm -e "$scpConnectionCommand" &

sleep 5

sshConnectionCommand="$1"
echo -e "\n\nConnecting to webserver using $sshConnectionCommand"
nohup xterm -e "$sshConnectionCommand < ./upzipWebserverFilesAndStart.sh" &
sleep 1
echo -e "\n\nFinished with setupWebserver.sh"