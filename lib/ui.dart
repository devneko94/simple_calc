import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'define.dart';
import 'models.dart';

// 数字ボタン
class NumButton extends StatelessWidget {
  NumButton(this._name);
  final String _name;

  String formatText(String oldText, String inputChar) {
    double _inputNum = double.tryParse(oldText + inputChar) ?? 0;
    double _dif = _inputNum - (_inputNum ~/ 1);
    if (_dif == 0) {
      return (_inputNum ~/ 1).toString();
    } else {
      return _inputNum.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    ResultModel _model = Provider.of<ResultModel>(context);
    String _inputText = formatText(_model.showText, this._name);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          child: Text(
            this._name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
          onPressed: () => _model.inputText(_inputText),
        ),
      ),
    );
  }
}

// 記号ボタン
class ModeButton extends StatelessWidget {
  ModeButton(this._mode, this._icon);
  final CalcMode _mode;
  final FaIcon _icon;

  @override
  Widget build(BuildContext context) {
    ResultModel _model = Provider.of<ResultModel>(context, listen: false);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          child: _icon,
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
          onPressed: () {
            switch (this._mode) {
              case CalcMode.Add:
                _model.changeMode(CalcMode.Add);
                break;
              case CalcMode.Sub:
                _model.changeMode(CalcMode.Sub);
                break;
              case CalcMode.Times:
                _model.changeMode(CalcMode.Times);
                break;
              case CalcMode.Divide:
                _model.changeMode(CalcMode.Divide);
                break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}

// クリアボタン
class ClearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResultModel _model = Provider.of<ResultModel>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          child: Text(
            _model.isCleared ? 'AC' : 'C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
          onPressed: () {
            _model.isCleared ? _model.allClear() : _model.clear();
          },
        ),
      ),
    );
  }
}

// 一時的なテスト用ボタン
class TempButton extends StatelessWidget {
  final String _name;
  TempButton(this._name);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          child: Text(
            this._name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

// テキスト領域
class TextFiled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResultModel _model = Provider.of<ResultModel>(context);
    return SizedBox(
      height: 150,
      child: Container(
        color: Color(0xFF777777),
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.bottomRight,
        child: Text(
          _model.showText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
          ),
        ),
      ),
    );
  }
}

// キーボード
class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ClearButton(),
                NumButton('7'),
                NumButton('4'),
                NumButton('1'),
                NumButton('00'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TempButton('M+'),
                NumButton('8'),
                NumButton('5'),
                NumButton('2'),
                NumButton('0'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TempButton('M-'),
                NumButton('9'),
                NumButton('6'),
                NumButton('3'),
                NumButton('.'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ModeButton(
                    CalcMode.Divide,
                    FaIcon(
                      FontAwesomeIcons.divide,
                      color: Colors.white,
                    )),
                ModeButton(
                    CalcMode.Times,
                    FaIcon(
                      FontAwesomeIcons.times,
                      color: Colors.white,
                    )),
                ModeButton(
                    CalcMode.Sub,
                    FaIcon(
                      FontAwesomeIcons.minus,
                      color: Colors.white,
                    )),
                ModeButton(
                    CalcMode.Add,
                    FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                    )),
                ModeButton(
                    CalcMode.None,
                    FaIcon(
                      FontAwesomeIcons.equals,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
