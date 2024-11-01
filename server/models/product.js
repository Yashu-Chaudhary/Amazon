const mongooes = require('mongoose');

const productSchema = mongooes.Schema({
    name: {
        trim: true,
        type: String,
        required: true,
    },
    description: {
        trim: true,
        type: String,
        required: true,
    },
    // way to store array
    images: [{
        type: String,
        required: true,
    }],
    price: {
        type: Number,
        required: true,
    }, 
    quantity: {
        type: Number,
        required: true,
    }, 
    category: {
        trim: true,
        type: String,
        required: true,
    },
    // rating
});

const Product = mongooes.model("Product", productSchema);
module.exports = Product