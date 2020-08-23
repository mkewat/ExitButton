import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}

class DemoState extends State<Demo> {
  DateTime dateTime;
  void exitButton() {
    DateTime currentTime = DateTime.now();

    bool backPressTimeTaken = dateTime == null ||
        currentTime.difference(dateTime) > Duration(seconds: 2);

    if (backPressTimeTaken) {
      dateTime = currentTime;
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitButton();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit Button'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              child: Text('Exit'),
              onPressed: () {
                // SystemNavigator.pop();
                // exitButton();
              },
            ),
          ),
        ),
      ),
    );
  }
}
