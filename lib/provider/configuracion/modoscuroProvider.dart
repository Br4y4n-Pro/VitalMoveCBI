import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';

class ChangeTheme with ChangeNotifier {
  bool _isdarktheme = false;

  get isdarktheme => _isdarktheme;

  set isdraktheme(bool _) {
    _isdarktheme = _;
    notifyListeners();
  }
}
