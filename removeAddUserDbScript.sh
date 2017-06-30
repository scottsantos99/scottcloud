echo -e "\n\nRemove and add db user"

./mongodb/bin/mongo --eval db.dropUser("serviceUser")
./mongodb/bin/mongo --eval db.createUser( { user: "serviceUser", pwd: "Qpmz123$", roles: [ { role: "readWrite", db: "test" } ] } )

echo -e "\n\nDone removing and adding db user"
