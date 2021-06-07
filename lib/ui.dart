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

  @override
  Widget build(BuildContext context) {
    ResultModel _model = Provider.of<ResultModel>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              this._name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
          onPressed: () {
            if (_model.isAfterModeChanged) {
              _model.clear();
              _model.isAfterModeChanged = false;
            }
            _model.inputShowText(this._name);
          },
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
              case CalcMode.None:
                _model.doCalc(double.parse(_model.showText));
                _model.changeMode(CalcMode.None);
                break;
              case CalcMode.Add:
                _model.doCalc(double.parse(_model.showText));
                _model.changeMode(CalcMode.Add);
                break;
              case CalcMode.Sub:
                _model.doCalc(double.parse(_model.showText));
                _model.changeMode(CalcMode.Sub);
                break;
              case CalcMode.Times:
                _model.doCalc(double.parse(_model.showText));
                _model.changeMode(CalcMode.Times);
                break;
              case CalcMode.Divide:
                _model.doCalc(double.parse(_model.showText));
                _model.changeMode(CalcMode.Divide);
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
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              _model.isCleared ? 'AC' : 'C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
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
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              this._name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
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
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Container(
            color: Colors.black54,
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            alignment: Alignment.topRight,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: _model.modeIcon,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: Container(
            color: Colors.black54,
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            alignment: Alignment.bottomRight,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                _model.showText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 78,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// キーボード
class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      // childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: [
        ClearButton(),
        TempButton('M+'),
        TempButton('M-'),
        ModeButton(
            CalcMode.Divide,
            FaIcon(
              FontAwesomeIcons.divide,
              color: Colors.white,
            )),
        NumButton('7'),
        NumButton('8'),
        NumButton('9'),
        ModeButton(
            CalcMode.Times,
            FaIcon(
              FontAwesomeIcons.times,
              color: Colors.white,
            )),
        NumButton('4'),
        NumButton('5'),
        NumButton('6'),
        ModeButton(
            CalcMode.Sub,
            FaIcon(
              FontAwesomeIcons.minus,
              color: Colors.white,
            )),
        NumButton('1'),
        NumButton('2'),
        NumButton('3'),
        ModeButton(
            CalcMode.Add,
            FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            )),
        NumButton('00'),
        NumButton('0'),
        NumButton('.'),
        ModeButton(
            CalcMode.None,
            FaIcon(
              FontAwesomeIcons.equals,
              color: Colors.white,
            )),
      ],
    ));
  }
}
