// ignore_for_file: file_names, avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';

class PublicacionFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  File? imagen;
  String? fecha;
  String idpublicacion = '';
  String recomendaciones = '';
  String titulo = '';

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
