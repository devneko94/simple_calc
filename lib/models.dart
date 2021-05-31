import 'package:flutter/material.dart';
import 'define.dart';

class ResultModel extends ChangeNotifier {
  String showText = '0';
  double calcResult = 0;
  CalcMode calcMode = CalcMode.None;
  bool isCleared = true;

  void inputText(String newText) {
    this.showText = newText;
    notifyListeners();
  }

  void changeMode(CalcMode newMode) {
    this.calcMode = newMode;
    notifyListeners();
  }

  void doCalc(num newValue) {
    switch (calcMode) {
      case CalcMode.None:
        break;
      case CalcMode.Add:
        this.calcResult += newValue;
        break;
      case CalcMode.Sub:
        this.calcResult -= newValue;
        break;
      case CalcMode.Times:
        this.calcResult *= newValue;
        break;
      case CalcMode.Divide:
        this.calcResult /= newValue;
        break;
    }
    notifyListeners();
  }

  void clear() {
    this.showText = '0';
    notifyListeners();
  }

  void allClear() {
    this.showText = '0';
    this.calcResult = 0;
    this.calcMode = CalcMode.None;
    notifyListeners();
  }
}
