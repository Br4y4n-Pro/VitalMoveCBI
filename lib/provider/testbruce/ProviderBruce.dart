// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/recomendacionTests/recomendacionFromProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/BruceFromProvider.dart';
import 'package:vitalmovecbi/services/localStorage.dart';
import '../../Api/AllApi.dart';
import '../../Modelos/TestBruceModelo.dart';

class BruceProvider extends ChangeNotifier {
  List<BruceTest> brucetests = [];
  limpiarDatos(RecomendacionFromProvider fromProviderRecomendacion,
      BruceFromProvider fromProvider) {
    fromProvider.saturacion = '';
    fromProvider.etapa = '';
    fromProviderRecomendacion.descripcion = '';
    notifyListeners(); // Notificar a los oyentes sobre el cambio
  }
  bruce(
      BruceFromProvider fromProvider,
      RecomendacionFromProvider fromProviderRecomendacion,
      BuildContext context) {
    final id = LocalStorage.prefs.getString('idselecionado');

    final data = {
      "etapas": fromProvider.etapa,
      "saturacionvodos": fromProvider.saturacion,
      "descripcion": fromProviderRecomendacion.descripcion,
      "idusuario": id,
    };
    print(data);

    AllApi.httpPost('crearTestBruce', data).then((rpta) {
      print("ESperando");
      print(rpta.runtimeType);

      final Map<String, dynamic> jsonResponse = rpta;
      if (jsonResponse["rp"] == "si") {
        limpiarDatos(fromProviderRecomendacion, fromProvider);
        Navigator.pop(context);
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.green.shade600,
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
      } else {
        // ischeck = false;
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
      print(jsonResponse);
    });
  }
}
