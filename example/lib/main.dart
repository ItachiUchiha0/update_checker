import 'dart:io';

import 'package:flutter/material.dart';
import 'package:update_checker/update_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    var checker = UpdateChecker(); // create an object from UpdateChecker

    //check your OS if android pass the play store URL and so do iOS
    if (Platform.isIOS) {
      checker.checkForUpdates("YOUR_APP_STORE_URL").then((value) => {
            // if value is true you can show a dialog to redirect user to app store to perform update
          });
    } else if (Platform.isAndroid) {
      checker
          .checkForUpdates(
            "YOUR_PLAY_STORE_URL",
          )
          .then((value) => {
                // if value is true you can show a dialog to redirect user to play store to perform update
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Hello Update checker!'),
        ),
      ),
    );
  }
}
