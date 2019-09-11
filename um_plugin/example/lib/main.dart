import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:um_plugin/um_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    // dzytest 
    // 5d7901693fc1954a3a0009cd 安卓
    // 57a19c3ee0f55ac1d5001732 ios
    await UmPlugin.setUp('5d78a3ce3fc19514630008e5',channel: 'um_plugin');
    if (!mounted) return;
  }

  _toClickNumber() async {
    await UmPlugin.addEvent('start', label: 'pid');
    await UmPlugin.addEvent('end', label: 'pid');
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('add event'),
              onPressed: () {
                _toClickNumber();
              },
            ),
          ],
        )),
      ),
    );
  }
}
