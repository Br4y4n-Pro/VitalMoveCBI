import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/login/LoginFromProvider.dart';

import '../../Api/AllApi.dart';
import '../../Modelos/UsuariosModelo.dart';

// class LoginProvider extends ChangeNotifier {
//   List<Usuario> usuarios = [];

//   login(LoginFromProvider fromProvider, BuildContext context) {
//     final data = {
//       "dni": fromProvider.usuario,
//       "contrasena": fromProvider.password
//     };
//     print(data);

//     AllApi.httpPost('login', data).then((rpta) {
//       final List jsonResponse = json.decode(rpta);
//       print(rpta);
//         print('login:  ${json.encode(jsonResponse)}');
//       print(jsonResponse);
//       for (var datos in jsonResponse) {
//         if (datos['rp'] == 'si') {
//           final Usuarios usuarios = Usuarios.fromlist([rpta]);
//           this.usuarios = usuarios.dato;
//           Navigator.pushReplacementNamed(context, '/homeUsuario');
//         } else {
//           print('${datos['mensaje']}');
//         }
//       }
//     }).catchError((onError) {
//       print(onError.toString());
//     });
//   }
// }

class LoginProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];

  login(LoginFromProvider fromProvider, BuildContext context) {
    final data = {
      "dni": fromProvider.usuario,
      "contrasena": fromProvider.password
    };
    print(data);

    AllApi.httpPost('login', data).then((rpta) {
      final Map<String, dynamic> jsonResponse = json.decode(rpta);
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
