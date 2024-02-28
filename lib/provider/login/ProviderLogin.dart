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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
              // padding: const EdgeInsets.all(8),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                      weight: 40,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${jsonResponse['mensaje']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ],
                ),
              ),
            )));
        // print('${jsonResponse['mensaje']}');
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
