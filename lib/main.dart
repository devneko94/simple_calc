import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'models.dart';
import 'ui.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultModel>(
      create: (context) => ResultModel(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.black54),
        home: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            toolbarHeight: 30,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  TextArea(),
                  SizedBox(height: 10),
                  Keyboard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
