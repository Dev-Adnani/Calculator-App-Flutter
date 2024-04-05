import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorNotifier with ChangeNotifier {
  String _input = '';
  String _output = '';
  bool _anyError = false;

  String get input => _input;
  String get output => _output;
  bool get anyError => _anyError;

  final List<String> buttons = [
    'C',
    '<',
    '/',
    '*',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '^',
    '%',
    '0',
    '.',
    '=',
  ];

  void onButtonPressed({required String value}) {
    if (value == '=') {
      _calculateResult();
    } else if (value == 'C') {
      _clearInput();
    } else if (value == '<') {
      _removeLastCharacter();
    } else {
      _input += value;
    }

    notifyListeners();
  }

  void _calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_input);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      _output = result.toStringAsFixed(2);
      _anyError = false;
    } catch (e) {
      _anyError = true;
      _output = "Invalid Expression";
    }
  }

  void _clearInput() {
    _input = '';
    _output = '';
    notifyListeners();
  }

  void _removeLastCharacter() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
      notifyListeners();
    }
  }
}
