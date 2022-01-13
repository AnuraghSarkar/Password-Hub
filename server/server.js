const mongoose = require("mongoose");
require("dotenv").config();
var app = require("express")();
var http = require("http").createServer(app);
var io = require("socket.io")(http, {
  cors: {
    origins: "*:*",
    methods: ["GET", "POST"],

    credentials: true,
  },
});
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

var port = process.env.PORT || 3000;

io.on("connection", (socket) => { 
  console.log("a user connected");
  socket.on("create-game", async (nickname, name, maxrounds, maxroomsize) => {
    
  });
});

http.listen(port, () => {
  console.log("listening on *:" + port);
});
