// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/TestBruceModelo.dart';
import 'package:vitalmovecbi/services/localStorage.dart';

class BruceGetProvider extends ChangeNotifier {
  List<BruceTest> bruces = [];

  bruceOneUser(BuildContext context) {
    final id = LocalStorage.prefs.getString('id');
    // final idUsuario = idusario;
    print('id de usuario es $id');
    AllApi.httpGet('allBruce/$id').then((rpta) {
      // Asumiendo que `rpta` es una lista de mapas, cada uno representando una Caminata.
      print(rpta.runtimeType);
      // final Map<String, dynamic> jsonResponse = rpta;
      // print(jsonResponse);
      if (rpta is List) {
        // Limpia la lista actual para evitar duplicados
        bruces.clear();
        // Itera sobre la lista y crea una caminata por cada mapa en la lista
        for (var item in rpta) {
          final caminata = BruceTest.fromJsonMap(item);
          bruces.add(caminata);
        }
        print(bruces);
        print(bruces.length);
        // Notifica a los listeners que la lista de usuarios ha cambiado
        notifyListeners();
      }
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print(" providerGetBruce: Error al obtener Tests Bruces: $error");
    });
  }
}
