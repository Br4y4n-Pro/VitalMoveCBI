// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';

class RecomendacionFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  int? idtests;
  String descripcion = '';

  validateFrom() {
    if (fromkey.currentState!.validate()) {
      print('from valid ... Caminata');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
// xs
