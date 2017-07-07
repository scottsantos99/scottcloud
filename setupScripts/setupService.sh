#!/bin/bash

echo "Committing files"
./pushServiceFiles.sh
sshConnectionCommandForService="$1"
echo -e "\n\nPulling app.js using: $sshConnectionCommandForService"
sleep 5
nohup xterm -e "$sshConnectionCommandForService < ./pullCodeAndStartService.sh" &
sleep 5
echo "Done with pulling app.js and starting service"