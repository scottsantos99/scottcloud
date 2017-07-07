#!/bin/bash

echo -e "\n\nKilling node"
cd ~/service
npm stop

echo -e "\n\nPulling App.js"
cd ~/scottcloud
git pull
cp app.js ~/service
cp ./models/*.js ~/service/models
cd ~/service
npm start
echo -e "\n\nDone Pulling app.js"