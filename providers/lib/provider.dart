import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  int _result = 0;

  int get result => _result;

  void add(int a, int b) {
    _result = a + b;
    notifyListeners();
  }

  void subtract(int a, int b) {
    _result = a - b;
    notifyListeners();
  }
}
