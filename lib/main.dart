import 'package:flutter/material.dart';
import 'clientWebsocket.dart';
import 'DatatoSend.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'UAV Control!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String defaultTextFeildStr = DatatoSend().getLightControlCode();
  // String dataToSend = DatatoSend().getDistSensorCode();
  String dataToSend = DatatoSend().getLightControlCode();

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget textEntry() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Center(
          child: TextFormField(
        initialValue: defaultTextFeildStr,
        decoration: InputDecoration(
          labelText: "Enter Code",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        maxLines: null,
        onChanged: (data) {
          setState(() {
            dataToSend = data;
          });
        },
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      )),
    );
  }

  void sendData() {
    ClientWebSocket(dataToSend);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textEntry(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: sendData,
        tooltip: 'Increment',
        icon: Icon(Icons.send),
        label: Text("Send Data"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
