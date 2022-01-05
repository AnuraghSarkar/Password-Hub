const express = require("express");
let http = require("http");
const mongoose = require("mongoose");
require("dotenv").config();

const app = express();
const port = process.env.PORT || 3000;

let server = http.createServer(app);

let io = require("socket.io")(server);

// middleware

app.use(express.json());

// connect to mongodb
mongoose
  .connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    // useFindAndModify: false,
    // useCreateIndex: true,
  })
  .then(() => {
    console.log("database connected.");
  })
  .catch((err) => console.log(err.message));

app.listen(port, () => console.log(`Server running at ${port}!`));
