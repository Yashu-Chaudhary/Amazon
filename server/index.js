const express = require('express');
const mongooes = require('mongoose');
// imports from files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');

// intializations
const app = express();
const PORT = 3000;
const uri = "mongodb+srv://yashusky232:yashu777@cluster0.gp2wh.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// middleware
app.use(express.json());
app.use(authRouter); 
app.use(adminRouter);

// connection to mogoDb
mongooes.connect(uri)
    .then(() => {
        console.log('connected to database');
    }).catch((e) => {
        console.log(e);
    });

// server
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is starting at port ${PORT}`)
});

