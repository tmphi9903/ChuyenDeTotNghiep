
const express = require("express");
const expressSantizer = require("express-santizer");

const app = express();

app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.use(expressSantizer());

app.use("/", express.static("public"));

const PORT = 8000;

app.listen(PORT, () => {
    console.log('Server started on port $(PORT)');
});