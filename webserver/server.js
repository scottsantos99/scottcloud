var express = require('express');

var app = express();

var port = 5000;

var path = require('path');

var clientFilesDir = path.join(__dirname, "dist/client");

app.use(express.static(clientFilesDir));

app.get('/', function(req, res) {
    res.sendFile(path.join(clientFilesDir + '/index.html'));
});

app.listen(port, function(err) {
    process.title = 'scottwebapp';
    console.log('running of port:' + port);
})