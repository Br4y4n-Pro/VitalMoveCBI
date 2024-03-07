// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
// import 'package:vitalmovecbi/Modelos/CaminataModelo.dart';
import 'package:vitalmovecbi/provider/caminata/caminataFromProvider.dart';

class ProviderCaminata extends ChangeNotifier {
  caminata(CaminataFromProvider fromProvider, BuildContext context) {
    final data = {
      "fcr": fromProvider.fcr,
      "fcm": fromProvider.fcm,
      "tiempo": fromProvider.tiempo,
      "distancia": fromProvider.distancia
    };
    print(data);

    AllApi.httpPost('crearCaminata', data).then((rpta) {
      print("Esperando");
      print(rpta.runtimeType);

      final Map<String, dynamic> jsonResponse = rpta;
      if (jsonResponse["rp"] == "si") {
        Navigator.pushReplacementNamed(context, "/evaluadorHome");
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
