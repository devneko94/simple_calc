import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'define.dart';

class ResultModel extends ChangeNotifier {
  String showText = '0';
  double calcResult = 0;
  CalcMode calcMode = CalcMode.None;
  FaIcon? modeIcon;
  bool isCleared = true;

  void inputText(String newChar) {
    this.showText = _formatText(showText, newChar);
    notifyListeners();
  }

  void changeMode(CalcMode newMode) {
    this.calcMode = newMode;
    switch (calcMode) {
      case CalcMode.None:
        modeIcon = null;
        break;
      case CalcMode.Add:
        modeIcon = FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        );
        break;
      case CalcMode.Sub:
        modeIcon = FaIcon(
          FontAwesomeIcons.minus,
          color: Colors.white,
        );
        break;
      case CalcMode.Times:
        modeIcon = FaIcon(
          FontAwesomeIcons.times,
          color: Colors.white,
        );
        break;
      case CalcMode.Divide:
        modeIcon = FaIcon(
          FontAwesomeIcons.divide,
          color: Colors.white,
        );
        break;
    }

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

  String _formatText(String oldText, String inputNum) {
    String result = oldText + inputNum;
    bool isFormatted = false;

    while (!isFormatted) {
      isFormatted = true;

      if (result.startsWith('0') && !result.startsWith('0.')) {
        result = result.substring(1);
        isFormatted = false;
      }

      if (result.startsWith('00.')) {
        result = result.substring(1);
        isFormatted = false;
      }

      if (result.length - result.replaceAll('.', '').length > 1) {
        int idx = result.indexOf('.');

        while (idx > -1) {
          result = result.replaceFirst('.', '', idx + 1);
          idx = result.indexOf('.', idx + 1);
        }
        isFormatted = false;
      }

      if (result.length > 18) {
        result = oldText;
      }
    }
    return result;
  }
}
