import 'package:flutter/material.dart';
import 'package:hex_app/hex_string.dart';

enum InputType { decimal, hex }

class DisplayTextModel with ChangeNotifier {
  static const _defaultValue = '';
  var _inputString = _defaultValue;
  var _inputType = InputType.decimal;

  void registerInput(String input) {
    _inputString += input;
    notifyListeners();
  }

  void clear() {
    _inputString = _defaultValue;
    notifyListeners();
  }

  InputType get inputType => _inputType;

  void toggleInputType() {
    _inputType =
        _inputType == InputType.decimal ? InputType.hex : InputType.decimal;
    notifyListeners();
  }

  String get topText {
    if (inputType == InputType.decimal) {
      return _inputString.isEmpty ? '0' : _inputString;
    } else {
      return _inputString.isEmpty ? '0x0' : '0x$_inputString';
    }
  }

  String get bottomText {
    if (inputType == InputType.decimal) {
      return _inputString.isEmpty ? '0x0' : _inputString.toHexString();
    } else {
      return _inputString.isEmpty ? '0' : _inputString.toDecString();
    }
  }
}
