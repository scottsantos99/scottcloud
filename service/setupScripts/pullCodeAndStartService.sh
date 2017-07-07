#!/bin/bash

echo -e "\n\nKilling node"
cd ~/service
npm stop

echo -e "\n\nPulling App.js"
cd ~/scottcloud
git pull
cp service/app.js ~/service
cp service/models/*.js ~/service/models
cd ~/service
npm start
echo -e "\n\nDone Pulling app.js"