import 'package:flutter/material.dart';

import 'ui/BMIHome.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BMIHome(),
    );
  }
}
