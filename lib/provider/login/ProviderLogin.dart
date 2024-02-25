
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/login/LoginFromProvider.dart';

import '../../Api/AllApi.dart';
import '../../Modelos/UsuariosModelo.dart';


class LoginProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];

  login(LoginFromProvider fromProvider, BuildContext context) {
    final data = {
      "dni": fromProvider.usuario,
      "contrasena": fromProvider.password
    };
    print(data);

    AllApi.httpPost('login', data).then((rpta) {
      print(rpta.runtimeType);

      final Map<String, dynamic> jsonResponse = rpta;
      print('login: $rpta');
      print(jsonResponse);

      if (jsonResponse['rp'] == 'si') {
        final Usuarios usuarios = Usuarios.fromlist([jsonResponse]);
        this.usuarios = usuarios.dato;
        Navigator.pushReplacementNamed(context, '/homeUsuario');
      } else {
        print('${jsonResponse['mensaje']}');
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
