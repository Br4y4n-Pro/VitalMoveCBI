// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/provider/caminata/caminataFromProvider.dart';
import 'package:vitalmovecbi/provider/recomendacionTests/recomendacionFromProvider.dart';
import 'package:vitalmovecbi/services/localStorage.dart';

class ProviderCaminata extends ChangeNotifier {
  bool ischeck = false;
  limpiarDatos(RecomendacionFromProvider fromProviderRecomendacion,
      CaminataFromProvider fromProvider) {
    fromProvider.tiempo = '';
    fromProvider.distancia = '';
    fromProvider.fcm = '';
    fromProvider.fcr = '';
    fromProviderRecomendacion.descripcion = '';
    notifyListeners(); // Notificar a los oyentes sobre el cambio
  }

  caminata(
      CaminataFromProvider fromProvider,
      RecomendacionFromProvider fromProviderRecomendacion,
      BuildContext context) {
    final id = LocalStorage.prefs.getString('idselecionado');

    final data = {
      "idusuario": id,
      "fcr": fromProvider.fcr,
      "fcm": fromProvider.fcm,
      "tiempo": fromProvider.tiempo,
      "distancia": fromProvider.distancia,
      "descripcion": fromProviderRecomendacion.descripcion
    };
    print(data);

    AllApi.httpPost('crearCaminata', data).then((rpta) {
      print("Esperando");
      print(rpta.runtimeType);
      ischeck = false;
      notifyListeners();
      final Map<String, dynamic> jsonResponse = rpta;
      if (jsonResponse["rp"] == "si") {
        limpiarDatos(fromProviderRecomendacion, fromProvider);
        Navigator.pop(context);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(30),
              content: Text(
                'La baremación de su test es ${jsonResponse['barevodos']}',
                style: TextStyle(fontSize: 20),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 40,
                        content: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.green.shade600,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
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
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        )));

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Regresar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            );
          },
        );
        notifyListeners();
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
                      '${jsonResponse['mensaje ']}',
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
