const mongoose = require("mongoose");
require("dotenv").config();
let app = require("express")();
let http = require("http").createServer(app);
const Room = require("./models/Room");
const User = require("./models/User");
let io = require("socket.io")(http, {
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
    try {
      const existingRoom = await Room.findOne({ name });
      if (existingRoom) { 
        socket.emit("room-exists", "Room already exists");
        return;
      }
      let room = new Room();
      const word = getWord();
    } catch(err) {}
  });
});

http.listen(port, () => {
  console.log("listening on *:" + port);
});
