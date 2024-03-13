import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/login/LoginFromProvider.dart';

import '../../Api/AllApi.dart';
import '../../Modelos/UsuariosModelo.dart';
import '../../services/localStorage.dart';

class LoginProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];
  bool ischeck = false;

  login(LoginFromProvider fromProvider, BuildContext context) {
    final data = {
      "dni": fromProvider.usuario,
      "contrasena": fromProvider.password
    };

    void limpiarDatos(LoginFromProvider fromProvider) {
      fromProvider.password = '';
      fromProvider.usuario = '';
      notifyListeners();
    }

    print(data);

    AllApi.httpPost('login', data).then((rpta) {
      ischeck = false;
      print("ESperando");
      print(rpta.runtimeType);
      final Map<String, dynamic> jsonResponse = rpta;
      print(jsonResponse);

      if (jsonResponse['rp'] == 'si') {
        final Usuarios usuarios = Usuarios.fromlist([jsonResponse]);

        this.usuarios = usuarios.dato;
        
        LocalStorage.prefs.setString('id', usuarios.dato[0].idUsuario!);
        if (jsonResponse['rol'] == 1) {
          limpiarDatos(fromProvider);
          Navigator.pushReplacementNamed(context, '/pageviewsEvaluador');
        } else {
          Navigator.pushReplacementNamed(context, '/pageViewHome');
        }
      } else {
        ischeck = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
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
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
              ),
            )));
        // print('${jsonResponse['mensaje']}');
      }
      notifyListeners();
    }).catchError((onError) {
      ischeck = false;
      notifyListeners();
      print(onError.toString());
    });
  }
}
