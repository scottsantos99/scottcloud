#!/bin/bash

cd VisualStudio/scottcloud/service
git remote set-url origin git@github.com:scottsantos99/scottcloud.git
git add app.js
git commit -m "changed dns for db"
git push