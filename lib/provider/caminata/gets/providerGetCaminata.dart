import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/CaminataModelo.dart';
import 'package:vitalmovecbi/services/localStorage.dart';

class CaminataGetProvider extends ChangeNotifier {
  List<Caminata> caminatas = [];

  caminataOfUser(BuildContext context) {
    final id = LocalStorage.prefs.getString('id');
    // final idUsuario = idusario;
    print('id de usuario es $id');
    AllApi.httpGet('allCaminata/$id').then((rpta) {
      // Asumiendo que `rpta` es una lista de mapas, cada uno representando una Caminata.
      print(rpta.runtimeType);
      // final Map<String, dynamic> jsonResponse = rpta;
      // print(jsonResponse);
      if (rpta is List) {
        // Limpia la lista actual para evitar duplicados
        caminatas.clear();
        // Itera sobre la lista y crea una caminata por cada mapa en la lista
        for (var item in rpta) {
          final caminata = Caminata.fromJsonMap(item);
          caminatas.add(caminata);
        }
        print(caminatas);
        print(caminatas.length);
        // Notifica a los listeners que la lista de usuarios ha cambiado
        notifyListeners();
      }
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print(" providerGetCaminata: Error al obtener Caminatas: $error");
    });
  }
}
