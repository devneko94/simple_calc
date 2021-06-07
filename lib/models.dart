import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'define.dart';

class ResultModel extends ChangeNotifier {
  String showText = '0';
  double calcResult = 0.0;
  CalcMode calcMode = CalcMode.None;
  FaIcon? modeIcon;
  bool isAfterModeChanged = false;
  bool isCleared = true;

  void inputShowText(String newChar) {
    this.showText = _formatInputText(showText, newChar);
    this.isCleared = false;
    this.isAfterModeChanged = false;
    notifyListeners();
  }

  void showResult(double result) {
    this.showText = _formatResult(result.toString());
    this.isCleared = true;
    notifyListeners();
  }

  void changeMode(CalcMode newMode) {
    this.calcMode = newMode;
    switch (calcMode) {
      case CalcMode.None:
        modeIcon = null;
        this.isAfterModeChanged = true;
        break;
      case CalcMode.Add:
        modeIcon = FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        );
        this.isAfterModeChanged = true;
        break;
      case CalcMode.Sub:
        modeIcon = FaIcon(
          FontAwesomeIcons.minus,
          color: Colors.white,
        );
        this.isAfterModeChanged = true;
        break;
      case CalcMode.Times:
        modeIcon = FaIcon(
          FontAwesomeIcons.times,
          color: Colors.white,
        );
        this.isAfterModeChanged = true;
        break;
      case CalcMode.Divide:
        modeIcon = FaIcon(
          FontAwesomeIcons.divide,
          color: Colors.white,
        );
        this.isAfterModeChanged = true;
        break;
    }
    notifyListeners();
  }

  void doCalc(double newValue) {
    switch (calcMode) {
      case CalcMode.None:
        this.calcResult = newValue;
        break;
      case CalcMode.Add:
        this.calcResult += newValue;
        showResult(this.calcResult);
        break;
      case CalcMode.Sub:
        this.calcResult -= newValue;
        showResult(this.calcResult);
        break;
      case CalcMode.Times:
        this.calcResult *= newValue;
        showResult(this.calcResult);
        break;
      case CalcMode.Divide:
        this.calcResult /= newValue;
        showResult(this.calcResult);
        break;
    }
    notifyListeners();
  }

  void clear() {
    this.showText = '0';
    this.isCleared = true;
    notifyListeners();
  }

  void allClear() {
    this.showText = '0';
    this.calcResult = 0;
    changeMode(CalcMode.None);
    notifyListeners();
  }

  String _formatResult(String result) {
    String _result = _formatInputText(result, '');

    // 小数点以下が0のみの場合、整数に整形
    if (_result.indexOf('.') > -1 &&
        int.parse(_result.substring(_result.indexOf('.') + 1)) == 0) {
      _result = _result.substring(0, _result.indexOf('.'));
    }

    return _result;
  }

  String _formatInputText(String oldText, String inputNum) {
    String _result = oldText + inputNum;
    bool _isFormatted = false;

    while (!_isFormatted) {
      _isFormatted = true;

      // 0始まりの自然数の場合は０を削除
      if (_result.startsWith('0') &&
          !_result.startsWith('0.') &&
          _result.length > 1) {
        _result = _result.substring(1);
        _isFormatted = false;
      }

      // "00."と0が2つある場合は1つ削除
      if (_result.startsWith('00.')) {
        _result = _result.substring(1);
        _isFormatted = false;
      }

      // 2つ目小数点が入力された場合は削除
      if (_result.length - _result.replaceAll('.', '').length > 1) {
        int idx = _result.indexOf('.');

        while (idx > -1) {
          _result = _result.replaceFirst('.', '', idx + 1);
          idx = _result.indexOf('.', idx + 1);
        }
        _isFormatted = false;
      }

      // 最長18桁に制限
      if (_result.length > 18) {
        _result = oldText;
        _isFormatted = false;
      }
    }

    // 3桁区切りのカンマを挿入
    // TODO: カンマ区切り処理
    return _result;
  }
}
