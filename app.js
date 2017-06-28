var express = require('express'),
    mongoose = require('mongoose');

var connectionOptions = {
    user: 'serviceUser',
    pass: 'Qpmz123$'
};

var db = mongoose.connect('mongod://ec2-13-58-245-73.us-east-2.compute.amazonaws.com:27017/test',
    connectionOptions);

console.log(mongoose.connection.readyState);

var restaurant = require('./models/restaurantModel');

var app = express();

var port = process.env.PORT || 3000;

var restaurantRouter = express.Router();

restaurantRouter.route('/restaurant')
    .get(function(req, res){
        restaurant.find(function(error, restaurants){
            console.log('starting restaurant find');
            if(err) console.log(err);
            else res.json(restaurants);
        }).
        limit(10);
    });

app.use('/api', restaurantRouter);

app.get('/', function(req, res) {
    res.send('welcome to my API!');
});

app.listen(port, function() {
    console.log('Gulp is running on PORT: ' + port);
});