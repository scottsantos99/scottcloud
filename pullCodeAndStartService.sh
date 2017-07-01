#!/bin/bash

echo -e "\n\nKilling node"
npm stop

echo -e "\n\nPulling App.js"
cd scottcloud
git pull
cp app.js ../service
cd ../service
npm start
echo -e "\n\nDone Pulling app.js"