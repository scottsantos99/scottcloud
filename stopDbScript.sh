#!/bin/bash

#echo -e "\n\nstarting mongo shell"
#./mongodb/bin/mongo --eval "db.stats()"
#statsResult=$?
#echo -e "$statsResult"
./mongodb/bin/mongo --eval "db=db.getSiblingDB('admin');db.shutdownServer()"
echo "done stopping db"