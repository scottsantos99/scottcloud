#!/bin/bash

#echo -e "\n\nstarting mongo shell"
#./mongodb/bin/mongo --eval "db.stats()"
#statsResult=$?
#echo -e "$statsResult"
#if ./mongodb/bin/mongo --eval "db.stats()"; then
    #: 
    ./mongodb/bin/mongo --eval "db=db.getSiblingDB('admin');db.shutdownServer()"
#fi
echo -e "done stopping db"