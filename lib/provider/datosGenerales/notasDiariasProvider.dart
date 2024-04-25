// ignore_for_file: file_names, avoid_print
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/notadiarias.dart';

class NotasDiariasProvider extends ChangeNotifier {
  List<NotasDiaria> notas = [];
  bool notaCargada = false;
  Random random = Random();

  notadiaria(BuildContext context) {
    int? id = random.nextInt(77) + 1;
    print('id de la nota es $id');
    AllApi.httpGet('notasDiarias/$id').then((rpta) {
      notaCargada = true;
      print(rpta.runtimeType);
      final Map<String, dynamic> jsonResponse = rpta;
      print(jsonResponse);
      final NotasDiarias notas = NotasDiarias.fromlist([jsonResponse]);
      this.notas = notas.dato;

      notifyListeners();
    }).catchError((error) {
      // Considera manejar el error de alguna manera
      print(" providerNotas: Error al obtener nota: $error");
    });
  }
}