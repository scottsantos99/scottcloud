#!/bin/bash

cd ~/VisualStudio/scottcloud/webserver
npm run build
cd dist
mkdir server
cp ../server.js ./server
cd ..
rm dist.zip
zip -1 -r dist.zip dist
git remote set-url origin git@github.com:scottsantos99/scottcloud.git
git add dist.zip
git commit -m 'auto checkin of prod files'
git push