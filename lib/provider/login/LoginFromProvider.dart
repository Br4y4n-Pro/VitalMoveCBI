import 'package:flutter/cupertino.dart';

class LoginFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey =  GlobalKey<FormState>();

  String usuario = '';
  String password = '';

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
