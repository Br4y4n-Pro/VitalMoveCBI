// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';

class BruceFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  String etapa = '';
  String saturacion = '';

  validateFrom() {
    if (fromkey.currentState!.validate()) {
      print('from valid ... Bruce');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
