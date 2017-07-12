echo -e "\n\nKilling node"
cd ~/site
npm stop

cd ..
rm -rf /site/*
mv dist.tar.gz ./site
cd site
tar -zxvf dist.tar.gz
mv ./dist/server/server.js ./
mv ./dist/server/package.json ./
npm start
rm dist.tar.gz
echo -e "\n\nFinished with unzipWebBlahblah.sh"