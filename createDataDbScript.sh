echo -e "\n\nStarting mongoimport"
./mongodb/bin/mongoimport --db test --collection restaurants --drop --file ./primer-dataset.json
echo -e "\n\nDone with mongoimport"