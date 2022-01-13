import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class PaintScreen extends StatefulWidget {
  final Map data;
  final String screenFrom;
  // const PaintScreen({Key? key, required this.data, required this.screenFrom}) : super(key: key);
  const PaintScreen({required this.data, required this.screenFrom});

  @override
  _PaintScreenState createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  late io.Socket _socket;

  @override
  void initState() {
    super.initState();
    connect();
    print(widget.data);
  }

  void connect() {
    _socket = io.io('http://127.0.0.2:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    // Listen to socket events

    _socket.connect();

    if (widget.screenFrom == 'createRoom') {
      _socket.emit('create-game', widget.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
