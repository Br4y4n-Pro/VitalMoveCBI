import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/login/LoginFromProvider.dart';

import '../../Api/AllApi.dart';
import '../../Modelos/UsuariosModelo.dart';

class LoginProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];

  login(LoginFromProvider fromProvider) {
    final data = {
      "dni": fromProvider.usuario,
      "contrasena": fromProvider.password,
    };
    print(data);

    AllApi.httpPost('login', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
      if (usuarios.dato.isNotEmpty) {
        this.usuarios = usuarios.dato;
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
