import 'package:flutter/material.dart';

class password_provider extends ChangeNotifier {
  bool _showNumberInput = false;
  bool _showPasswordInput = false;

  bool get showNumberInput => _showNumberInput;
  bool get showPasswordInput => _showPasswordInput;

  void showNumberInputField() {
    _showNumberInput = true;
    notifyListeners();
  }

  void showPasswordInputField() {
    _showPasswordInput = true;
    notifyListeners();
  }
}
