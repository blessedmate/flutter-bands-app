import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;

  SocketService() {
    _initConfig();
  }

  // Dart client
  void _initConfig() {
    _socket = IO.io('https://blessedmate-flutter-bands.herokuapp.com/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    // Receives a new message from the server
    // socket.on('new-message', (data) {
    //   print('new message:');
    //   print('name: ' + data['name']);
    //   print('message: ' + data['message']);
    //   print(data.containsKey('message2') ? data['message2'] : 'No message 2');
    // });

    socket.connect();
  }
}
