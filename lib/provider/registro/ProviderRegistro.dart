// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';

import '../../Api/AllApi.dart';
import '../../Modelos/UsuariosModelo.dart';

class RegistroProvider extends ChangeNotifier {
  List<Usuario> registroUsuario = [];
  bool ischeck = false;

  void limpiarDatos(RegistroFromProvider fromProvider) {
    fromProvider.dni = '';
    fromProvider.nombres = '';
    fromProvider.apellidos = '';
    fromProvider.genero = '';
    fromProvider.direccion = '';
    fromProvider.dependencia = '';
    fromProvider.fechaNacimiento;
    fromProvider.talla = '';
    fromProvider.rh = '';
    fromProvider.nombreEmergencia = '';
    fromProvider.parentesco = '';
    fromProvider.telefonoEmergencia = '';
    fromProvider.eps = '';
    fromProvider.alergias = '';
    fromProvider.contrasena = '';
    fromProvider.actividadsemana = '';
    fromProvider.nivelsemana = '';
    fromProvider.imgperfil;
    fromProvider.rol = '';
    fromProvider.grupo = '';
    fromProvider.peso = '';
    notifyListeners(); // Notificar a los oyentes sobre el cambio
  }

  registro(RegistroFromProvider fromProvider, BuildContext context) async {
    // Verificar que los campos obligatorios no estén vacíos
    if (fromProvider.dni.isEmpty ||
        fromProvider.nombres.isEmpty ||
        fromProvider.apellidos.isEmpty ||
        fromProvider.genero.isEmpty ||
        fromProvider.direccion.isEmpty ||
        fromProvider.dependencia.isEmpty ||
        fromProvider.fechaNacimiento == null ||
        fromProvider.talla.isEmpty ||
        fromProvider.rh.isEmpty ||
        fromProvider.nombreEmergencia.isEmpty ||
        fromProvider.parentesco.isEmpty ||
        fromProvider.telefonoEmergencia.isEmpty ||
        fromProvider.eps.isEmpty ||
        fromProvider.alergias.isEmpty ||
        fromProvider.contrasena.isEmpty ||
        fromProvider.actividadsemana.isEmpty ||
        fromProvider.grupo.isEmpty ||
        fromProvider.peso.isEmpty ||
        fromProvider.imgperfil!.path.isEmpty) {
      // Mostrar mensaje de error o realizar alguna acción apropiada
      ischeck = false;
      notifyListeners();

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 40,
          content: Container(
            // padding: const EdgeInsets.all(8),
            height: 70,
            decoration: BoxDecoration(
                color: Colors.red.shade600,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white,
                    weight: 40,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Wrap(
                      alignment: WrapAlignment.center,
                      direction:
                          Axis.horizontal, // Ajusta la dirección del texto
                      spacing: 8.0, // Espacio entre elementos envueltos
                      children: [
                        Text(
                          'Faltan datos por llenar',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ]),
                ],
              ),
            ),
          )));

      // print('${jsonResponse['mensaje']}');
    }

    FormData formData = FormData.fromMap({
      "dni": fromProvider.dni,
      "nombres": fromProvider.nombres,
      "apellidos": fromProvider.apellidos,
      "genero": fromProvider.genero,
      "direccion": fromProvider.direccion,
      "dependencia": fromProvider.dependencia,
      "fechanacimiento": fromProvider.fechaNacimiento?.toIso8601String(),
      "talla": fromProvider.talla,
      "rh": fromProvider.rh,
      "nombreemergencia": fromProvider.nombreEmergencia,
      "parentesco": fromProvider.parentesco,
      "telefonoemergencia": fromProvider.telefonoEmergencia,
      "eps": fromProvider.eps,
      "alergias": fromProvider.alergias,
      "contrasena": fromProvider.contrasena,
      "actividadsemana": fromProvider.actividadsemana,
      "grupo": fromProvider.grupo,
    });

// Agrega la imagen como un archivo al FormData

    if (!kIsWeb) {
      if (fromProvider.imgperfil != null) {
        formData.files.add(MapEntry(
          "imgperfil",
          await MultipartFile.fromFile(fromProvider.imgperfil!.path),
        ));
      }
    }
    print(formData);

    AllApi.httpPost('addUser', formData).then((dynamic rpta) {
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
        Navigator.pushReplacementNamed(context, '/evaluadorHome');
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
