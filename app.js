const express = require("express");
const morgan = require("morgan");
const mongoose = require("mongoose");
const cors = require("cors");
const compression = require("compression");
const helmet = require("helmet");

//importing dot env
require("dotenv/config");

//initializing api
//which is the initial route of api
const api = process.env.API_URL;

//Initializing app
const app = express();

//CORS
app.use(cors());
app.options("*", cors());

app.use(compression());

//Middlewares
//Middleware to serve static files
app.use(express.static("public"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(morgan("tiny"));
//Always use helmet for safety
app.use(helmet());



//Connecting to mongodb database
mongoose
  .connect(process.env.DATABASE, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
    dbName: "Key-Secure-v2",
    useFindAndModify: false,
  })
  .then(() => {
    console.log("Database connection is ready");
  })
  .catch((err) => {
    console.log(err);
  });

//Initializing port
const port = process.env.PORT || 3000;

//Running server
app.listen(port, () => {
  console.log(`Server is running at port ${port} ...`);
});
