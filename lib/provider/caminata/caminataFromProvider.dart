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
