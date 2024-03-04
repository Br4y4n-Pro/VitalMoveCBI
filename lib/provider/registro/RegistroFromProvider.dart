import 'dart:io';

import 'package:flutter/cupertino.dart';


class RegistroFromProvider extends ChangeNotifier {

  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  String dni = '';
  String nombres = '';
  String apellidos = '';
  String genero = '';
  String direccion = '';
  String dependencia = '';
  DateTime? fechaNacimiento;
  String talla = '';
  String rh = '';
  String nombreEmergencia = '';
  String parentesco = '';
  String telefonoEmergencia = '';
  String eps = '';
  String alergias = '';
  String contrasena = '';
  String actividadsemana = '';
  String nivelsemana = '';
  File? imgperfil ;
  String rol = '';
  String grupo = '';
  String peso = '';

  

  validateFrom() {
    if (fromkey.currentState!.validate()) {
      print('from valid ... Registro');

      return true;
    } else {
      print('from not Registro');
      return false;
    }
  }
}
