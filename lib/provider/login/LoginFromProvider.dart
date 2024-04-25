// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';

class LoginFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  String usuario = '';
  String password = '';

  get imgPublicacion => null;

  validateFrom() {
    if (fromkey.currentState!.validate()) {
      print('from valid ... login');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
