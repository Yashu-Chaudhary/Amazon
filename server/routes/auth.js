const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');

const authRoute = express.Router();

authRoute.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body

        // post the data in the database
        const exestingUser = await User.findOne({ email });
        if (exestingUser) {
            return res.status(400).json({ msg: 'User with same email already exists.' })
        }
        // get data from the client
        const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            email,
            password: hashedPassword,
            name,
        });

        user = await user.save();
        res.json(user);

    } catch (e) {
        res.status(500).json({ error: e.message });
    }

})

// --------------------------SignIn route-----------------------------------
authRoute.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;

        // checking is email already exist or not
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: "User with this email does not exist" });
        }

        // password checking
        const isMatched = await bcryptjs.compare(password, user.password);
        if (!isMatched) {
            return res.status(400).json({ msg: "Incorrect Password" });
        }
        const token = jwt.sign({ id: user._id }, "passwordKey", );

       
        res.json({ token, ...user._doc });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})

// ------------------token validation-------------------------
authRoute.post("/tokenIsValid", async (req, res) => {
    try {
        
        const token = req.header('x-auth-token');

        if (!token) return res.json(false);
        const verified = jwt.verify(token, 'passwordKey');
        if (!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if (!user) return res.json(false);
        else return res.json(true)

        

 
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


// --------------get user data-----------
authRoute.get('/', auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });

});

module.exports = authRoute;