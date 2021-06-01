import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';
import 'ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider<ResultModel>(
      create: (context) => ResultModel(),
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          brightness: Brightness.dark,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                TextFiled(),
                SizedBox(height: 20),
                Keyboard(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
