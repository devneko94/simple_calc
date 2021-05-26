import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

      ),
    )
  }
}

class ResultTextBox extends StatefulWidget {
  @override
  _ResultTextBox createState() => _ResultTextBox();
}

class _ResultTextBox extends State<ResultTextBox> {
  String showText = '';
  num calcResult = 0;

  String doCalc(String _showText, num _calcResult) {
    // TODO: 計算処理
    return 'test';
  }

  @override
  Widget build(BuildContext context) {
    return Text(showText);
  }
}

class NumButton extends StatelessWidget {
  NumButton(Key key, {required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}