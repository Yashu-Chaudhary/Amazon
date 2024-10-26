const express = require('express');
const User = require('../models/user');
const bcryptjs= require('bcryptjs');

const authRoute = express.Router();

authRoute.post("/api/signup", async (req, res) => {
    try{
        const { name, email, password } = req.body

        // post the data in the database
        const exestingUser = await User.findOne({ email });
        if (exestingUser) {
            return res.status(400).json({ msg: 'User with same email already exists.' })
        }
        const hashedPassword= await bcryptjs.hash(password,8);
        let user = new User({
            email,
            password :hashedPassword,
            name,
        });
    
        user= await user.save();
        res.json(user);
    
    } catch (e){
        res.status(500).json({error: e.message});
    }
    // get data from the client
   
    // return that data to the user
})

module.exports = authRoute