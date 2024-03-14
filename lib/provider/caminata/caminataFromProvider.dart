// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';

class CaminataFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  int? idusuario;
  DateTime? fecha;
  String fcr = '';
  String tiempo = '';
  String distancia = '';
  String fcm = '';
  String consumovo2 = '';
  String barevodos = '';

  get recomendacion => null;

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
