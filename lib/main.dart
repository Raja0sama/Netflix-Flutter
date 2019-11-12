import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flix/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       FlutterStatusbarcolor.setStatusBarColor(Colors.white.withOpacity(0.1));

    return  new MaterialApp(
          title: 'Display Tracker',
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new RootPage(),
        );
  }
}
