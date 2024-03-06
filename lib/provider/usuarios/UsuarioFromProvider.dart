import 'package:flutter/cupertino.dart';

class UsuarioFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

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
