#!/bin/bash

cd ~/VisualStudio/scottcloud/webserver
npm run build
cd dist
mkdir server
cp ../server.js ./server
cp ../package.json_prod ./server/package.json
cd ..
rm dist.zip
tar -zcvf dist.tar.gz ./dist
git remote set-url origin git@github.com:scottsantos99/scottcloud.git
git add dist.zip
git commit -m 'auto checkin of prod files'
git push