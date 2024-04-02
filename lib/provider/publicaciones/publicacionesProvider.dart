// ignore_for_file: file_names, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/Publicaciones.dart';
import 'package:vitalmovecbi/provider/publicaciones/publicacionesFromProvider.dart';

class PublicacionesProvider extends ChangeNotifier {
  List<Publicacion> usuarios = [];
  bool ischeck = false;

  publicacionesPr(
      PublicacionFromProvider fromProvider, BuildContext context) async {
    FormData formData = FormData.fromMap({
      "recomendacion": fromProvider.recomendaciones,
      "titulo": fromProvider.titulo
    });

    if (!kIsWeb) {
      if (fromProvider.imagen != null) {
        formData.files.add(MapEntry(
          "imgperfil",
          await MultipartFile.fromFile(fromProvider.imagen!.path),
        ));
      } else {
        // Modificación aquí: Agregar un MapEntry para 'imgperfil' con una cadena vacía como valor
        formData.fields.add(const MapEntry("imagen", ""));
      }
    } else {
      formData.fields.add(const MapEntry("imagen", ""));
    }

    void limpiarDatos(PublicacionFromProvider fromProvider) {
      fromProvider.imagen;
      fromProvider.recomendaciones = '';
      fromProvider.titulo = '';
      notifyListeners();
    }

    AllApi.httpPost('publicaciones', formData).then((dynamic rpta) {
      print(fromProvider.titulo);
      ischeck = false;

      print("ESperando");
      print(rpta.runtimeType);

      final Map<String, dynamic> jsonResponse = rpta;
      print(jsonResponse);
      if (jsonResponse['rp'] == 'si') {
        limpiarDatos(fromProvider);
        ischeck = false;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
              // padding: const EdgeInsets.all(8),
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
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ],
                ),
              ),
            )));
        Navigator.pushReplacementNamed(context, '/pageviewsEvaluador');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
              // padding: const EdgeInsets.all(8),
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
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
              ),
            )));
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
