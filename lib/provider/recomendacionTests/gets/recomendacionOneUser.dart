// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/RecomendacionesTest.dart';
import 'package:vitalmovecbi/services/localStorage.dart';

class RecomendacionGetProvider extends ChangeNotifier {
  List<Recomendacion> recomendaciones = [];
  bool recomendacionCargada = false;

  recomendacionOneUser(BuildContext context) {
    final idTest = LocalStorage.prefs.getInt('idEtapa');

    print('id de test es $idTest');
    print('aqui?');
    AllApi.httpGet('allRecomendaciones/$idTest').then((rpta) {
      print('Inicio el get de recomendacion $idTest');
      print(rpta.runtimeType);
      recomendacionCargada = true;
      print(rpta.runtimeType);
      final Map<String, dynamic> jsonResponse = rpta;
      print(jsonResponse);
      final Recomendaciones recomendacion =
          Recomendaciones.fromlist([jsonResponse]);
      recomendaciones = recomendacion.dato;
      notifyListeners();
    }).catchError((error) {
      print(
          " providerGetRecomendaciones: Error al obtener la recomendación: $error");
    });
  }
}
