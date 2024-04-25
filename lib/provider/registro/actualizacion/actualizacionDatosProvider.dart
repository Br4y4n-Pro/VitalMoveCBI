// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/provider/registro/actualizacion/actualizacionDatosFromProvider.dart';


class ActualizacionDatosProvider extends ChangeNotifier {
  List<Usuario> actuUsuario = [];
  bool ischeck = false;

  void limpiarDatos(ActualizacionDatosFromProvider fromProvider) {
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

  actualizacion(ActualizacionDatosFromProvider fromProvider, BuildContext context) async {
    // Verificar que los campos obligatorios no estén vacíos

    print('dni: ${fromProvider.dni}');
    print('nombres: ${fromProvider.nombres}');
    print('apellidos: ${fromProvider.apellidos}');
    print('genero: ${fromProvider.genero}');
    print('direccion: ${fromProvider.direccion}');
    print('dependencia: ${fromProvider.dependencia}');
    print(
        'fechanacimiento: ${fromProvider.fechaNacimiento?.toIso8601String()}');
    print('talla: ${fromProvider.talla}');
    print('rh: ${fromProvider.rh}');
    print('nombreemergencia: ${fromProvider.nombreEmergencia}');
    print('parentesco: ${fromProvider.parentesco}');
    print('telefonoemergencia: ${fromProvider.telefonoEmergencia}');
    print('eps: ${fromProvider.eps}');
    print('alergias: ${fromProvider.alergias}');
    print('contrasena: ${fromProvider.dni}');
    print('actividadsemana: ${fromProvider.actividadsemana}');
    print('grupo: ${fromProvider.grupo}');
    print('img:${fromProvider.imgperfil}');
  

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
      "contrasena": fromProvider.dni,
      "actividadsemana": fromProvider.actividadsemana,
      "grupo": fromProvider.grupo,
      "peso": fromProvider.peso
    });

// Filtrar los campos que están vacíos
formData.fields.removeWhere((entry) => entry.value.isEmpty);


    AllApi.httpPost('updateUser', formData).then((dynamic rpta) {
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
        notifyListeners();
      } else {
        ischeck = false;

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
        notifyListeners();
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
