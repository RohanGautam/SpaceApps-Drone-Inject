import 'dart:core';
import 'dart:io';

class ClientWebSocket {
  final HOST =
      "192.168.1.107"; // # The SERVER's hostname/IP - find from machine, should not be the public IP
  final PORT =
      65432; //Port to listen on (non-privileged ports are > 1023), should be same for client and server

  String datatoSend;

  ClientWebSocket(dataToSend){
    sendDataToServer(dataToSend);
  }

  void sendDataToServer(datatoSend) {
    Socket.connect(HOST, PORT).then((socket) {
      print('Connected to: '
          '${socket.remoteAddress.address}:${socket.remotePort}');
      socket.write(datatoSend);
      socket.destroy();
    });
  }
}
