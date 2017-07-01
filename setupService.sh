#!/bin/bash

sshConnectionCommandForService=$1
./commitPushFiles.sh
echo -e "\n\nPulling app.js using: $sshConnectionCommandForService"
nohup xterm -e "$sshConnectionCommandForService < ./pullCodeAndStartService.sh" &
echo "Done with pulling app.js and starting service"