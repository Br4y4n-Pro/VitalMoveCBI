import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/CaminataModelo.dart';

class CaminataGetProvider extends ChangeNotifier {
  List<Caminata> caminatas = [];

  caminataOfUser(BuildContext context) {
    // final idUsuario = idusario;

    AllApi.httpGet('allCaminata/1').then((rpta) {
      // Asumiendo que `rpta` es una lista de mapas, cada uno representando una Caminata.
      if (rpta is List) {
        // Limpia la lista actual para evitar duplicados
        caminatas.clear();
        // Itera sobre la lista y crea una caminata por cada mapa en la lista
        for (var item in rpta) {
          final caminata = Caminata.fromJsonMap(item);
          caminatas.add(caminata);
        }
        print(caminatas);
        // Notifica a los listeners que la lista de usuarios ha cambiado
        notifyListeners();
      }
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print("Error al obtener usuarios: $error");
    });
  }
}
