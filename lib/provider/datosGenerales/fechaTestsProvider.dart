// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/fechasTestsModelo.dart';
import 'package:vitalmovecbi/services/localStorage.dart';

class FechaTestProvider extends ChangeNotifier {
  List<FechaTest> fechas = [];

  fechasOnePerson(BuildContext context) {
    final id = LocalStorage.prefs.getString('id');
    // final idUsuario = idusario;
    print('id de usuario es $id');
    AllApi.httpGet('mesesCaminata/$id').then((rpta) {
      // Asumiendo que `rpta` es una lista de mapas, cada uno representando una Caminata.
      print(rpta.runtimeType);
      // final Map<String, dynamic> jsonResponse = rpta;
      // print(jsonResponse);
      if (rpta is List) {
        // Limpia la lista actual para evitar duplicados
        fechas.clear();
        // Itera sobre la lista y crea una caminata por cada mapa en la lista
        for (var item in rpta) {
          final fecha = FechaTest.fromJsonMap(item);
          fechas.add(fecha);
        }
        print(fechas);
        print(fechas.length);
        // Notifica a los listeners que la lista de usuarios ha cambiado
        notifyListeners();
      }
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print(" providerGetFechas: Error al obtener Caminatas: $error");
    });
  }
}
