#!/bin/bash

echo -e "\n\nPulling App.js"
cd scottcloud
git pull
cp app.js ../service
cd ../service
node app.js
echo -e "\n\nDone Pulling app.js"