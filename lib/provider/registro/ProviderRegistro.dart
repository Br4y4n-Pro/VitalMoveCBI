import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';

import '../../Api/AllApi.dart';
import '../../Modelos/UsuariosModelo.dart';

class RegistroProvider extends ChangeNotifier {
  List<Usuario> registroUsuario = [];
  String? filename = '';
  File? _imgperfil;
  File? get imgperfil => _imgperfil;

  Future<void> seleccionarImagen(
      BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);

    if (image == null) {
      print('No se seleccionó ninguna imagen');

      return;
    } else {
      filename = image.name;
      _imgperfil = File(image.path);
      notifyListeners();
    }
  }

  registro(RegistroFromProvider fromProvider, BuildContext context) async {
    final data = FormData.fromMap({
      "dni": fromProvider.dni,
      "nombres": fromProvider.nombres,
      "apellidos": fromProvider.apellidos,
      "genero": fromProvider.genero,
      "direccion": fromProvider.direccion,
      "dependencia": fromProvider.dependencia,
      "fechanacimiento": fromProvider.fechaNacimiento,
      "talla": fromProvider.talla,
      "rh": fromProvider.rh,
      "nombreemergencia": fromProvider.nombreEmergencia,
      "parentesco": fromProvider.parentesco,
      "telefonoemergencia": fromProvider.telefonoEmergencia,
      "eps": fromProvider.eps,
      "alergias": fromProvider.alergias,
      "contrasena": fromProvider.contrasena,
      "actividadsemana": fromProvider.actividadsemana,
      "nivelsemana": fromProvider.nivelsemana,
      "imgperfil": _imgperfil != null
          ? await MultipartFile.fromFile(_imgperfil!.path, filename: filename)
          : null,
      "rol": fromProvider.rol,
      "grupo": fromProvider.grupo
    });
    print(data);

    AllApi.httpPost('addUser', data as Map<String, dynamic>).then((rpta) {
      print("ESperando");
      print(rpta.runtimeType);

      final Map<String, dynamic> jsonResponse = rpta;
      print(jsonResponse);

      if (jsonResponse['rp'] == 'si') {
        final Usuarios usuarios = Usuarios.fromlist([jsonResponse]);
        this.registroUsuario = usuarios.dato;
        if (jsonResponse['rol'] == 1) {
          Navigator.pushReplacementNamed(context, '/evaluadorHome');
        } else {
          Navigator.pushReplacementNamed(context, '/homeUsuario');
        }
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
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ],
                ),
              ),
            )));
        // print('${jsonResponse['mensaje']}');
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
