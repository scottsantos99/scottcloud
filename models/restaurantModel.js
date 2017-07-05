var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var restaurantModel = new Schema({
    address: {
        building: String,
        coord: [Number],
        street: String,
        zipcode: String
    },
    borough: String,
    cuisine: String,
    grades: [{
      date: any,
      grade: String,
      score: Number
    }],
    name: String,
    restaurant_id: String
});

module.exports = mongoose.model('Restaurant', restaurantModel);