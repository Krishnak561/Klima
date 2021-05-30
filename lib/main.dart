import 'package:flutter/material.dart';
import 'Screen/loading_screen.dart';

void main() => runApp(RunApp());

class RunApp extends StatelessWidget {
  const RunApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Color(0xFFfbfbfb)),
      home: LoadingScreen(),
    );
  }
}
