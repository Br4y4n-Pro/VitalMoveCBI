import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';

import '../../Modelos/UsuariosModelo.dart';

class UsuarioProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];

  allUser(BuildContext context) {
    AllApi.httpGet('allUser').then((rpta) {
      // Asumiendo que `rpta` es una lista de mapas, cada uno representando un Usuario.
      if (rpta is List) {
        // Limpia la lista actual para evitar duplicados
        usuarios.clear();
        // Itera sobre la lista y crea un Usuario por cada mapa en la lista
        for (var item in rpta) {
          final usuario = Usuario.fromJsonMap(item);
          usuarios.add(usuario);
        }
        // Notifica a los listeners que la lista de usuarios ha cambiado
        notifyListeners();
      }
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print("Error al obtener usuarios: $error");
    });
  }
}
