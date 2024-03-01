import 'package:flutter/cupertino.dart';

class CaminataFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey =  GlobalKey<FormState>();

  int? idcaminata;
  int? idusuario;
  DateTime? fecha;
  double? fcr;
  double? tiempo;
  double? distancia;
  double? fcm;
  double? consumovo2;
  String barevodos = '';

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