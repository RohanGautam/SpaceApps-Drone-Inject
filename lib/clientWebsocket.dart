import 'dart:core';
import 'dart:io';

class ClientWebSocket {
  final HOST =
      "10.0.1.136"; // # The SERVER's hostname/IP - find from machine, should not be the public IP
  final PORT =
      65432; //Port to listen on (non-privileged ports are > 1023), should be same for client and server

  String datatoSend1 = //some python code..
      """
import math
def getPi():
  return math.pi
print(getPi())
""";
//   String datatoSend = """
// import RPi.GPIO as GPIO
// import time

// GPIO.setwarnings(False)
// GPIO.setmode(GPIO.BOARD)
// GPIO.setup(8, GPIO.OUT, initial = GPIO.LOW)
// count = 1
// while count<10:
//   GPIO.output(8, GPIO.HIGH)
//   time.sleep(1)
//   GPIO.output(8, GPIO.LOW)
//   time.sleep(1)
//   count+=1
//   """;
  String datatoSend;

  ClientWebSocket(dataToSend){
    print('in here $dataToSend');
    sendDataToServer(dataToSend);
  }

  void sendDataToServer(datatoSend) {
    Socket.connect(HOST, PORT).then((socket) {
      print('Connected to: '
          '${socket.remoteAddress.address}:${socket.remotePort}');
      socket.write(datatoSend);
      socket.listen((data) {
        // print(data);
        print(String.fromCharCodes(data).trim());
      }, onDone: () {
        socket.destroy();
      });
    });
  }
}
