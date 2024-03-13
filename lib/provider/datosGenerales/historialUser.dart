// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/historialModelo.dart';
import 'package:vitalmovecbi/services/localStorage.dart';

class HistorialProvider extends ChangeNotifier {
  List<Historial> historiales = [];
  bool historialCargado = false;
  historialOnePerson(BuildContext context) {
    final id = LocalStorage.prefs.getString('id');
    // final idUsuario = idusario;
    print('id de usuario es $id');
    AllApi.httpGet('loginHistorial/$id').then((rpta) {
      // Asumiendo que `rpta` es una lista de mapas, cada uno representando una Caminata.
      historialCargado = true;
      print(rpta.runtimeType);
      // final Map<String, dynamic> jsonResponse = rpta;
      // print(jsonResponse);
      if (rpta is List) {
        // Limpia la lista actual para evitar duplicados
        historiales.clear();
        // Itera sobre la lista y crea una caminata por cada mapa en la lista
        for (var item in rpta) {
          final historial = Historial.fromJsonMap(item);
          historiales.add(historial);
        }
        print(historiales);
        print(historiales.length);
        // Notifica a los listeners que la lista de usuarios ha cambiado
        notifyListeners();
      }
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print(" providerGetHistorial: Error al obtener Historial: $error");
    });
  }
}
