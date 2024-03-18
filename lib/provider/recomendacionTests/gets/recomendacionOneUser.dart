// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/RecomendacionesTest.dart';
import 'package:vitalmovecbi/services/localStorage.dart';

class RecomendacionGetProvider extends ChangeNotifier {
  List<Recomendacion> recomendaciones = [];

  recomendacionOneUser(BuildContext context) {
    print('Inicio el get de recomendacion');
    final idTest = LocalStorage.prefs.getString('idTest');
    print('id de usuario es $idTest');
    print('aqui?');
    // final idUsuario = idusario;
    AllApi.httpGet('allRecomendaciones/$idTest').then((rpta) {
      // Asumiendo que `rpta` es una lista de mapas, cada uno representando una Caminata.
      print(rpta.runtimeType);
      // final Map<String, dynamic> jsonResponse = rpta;
      // print(jsonResponse);
      if (rpta is List) {
        // Limpia la lista actual para evitar duplicados
        recomendaciones.clear();
        // Itera sobre la lista y crea una caminata por cada mapa en la lista
        for (var item in rpta) {
          final recomendacion = Recomendacion.fromJsonMap(item);
          recomendaciones.add(recomendacion);
        }

        // Notifica a los listeners que la lista de usuarios ha cambiado
        notifyListeners();
      }
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print(" providerGetCaminata: Error al obtener Caminatas: $error");
    });
  }
}
