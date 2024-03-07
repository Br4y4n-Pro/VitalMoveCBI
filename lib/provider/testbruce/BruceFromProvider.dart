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
