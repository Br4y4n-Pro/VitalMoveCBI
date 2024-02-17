// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalmovecbi/widgets/InputText.dart';
import 'package:vitalmovecbi/widgets/navap.dart';

class UsuarioLogin extends StatelessWidget {
  const UsuarioLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        nav(context),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Documento de Identidad",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 3,
              ),
              inputLogin("Ingrese Documento de Identidad", size.width),
              const SizedBox(height: 19),
              const Text("Contraseña",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 3,
              ),
              inputLogin("Ingrese tu contraseña", size.width),
              const SizedBox(height: 35),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .4, size.height * .06),
                        backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        padding: EdgeInsets.all(size.height * .002),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      _mostrarDialogo(context);
                    },
                    child: const Text('Acceder')),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

void _mostrarDialogo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmación'),
        content: const Text('¿Deseas ir a la pantalla siguiente?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/evaluadorHome');
            },
            child: const Text('Evaluador'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/homeUsuario');
            },
            child: const Text('Usuario'),
          ),
        ],
      );
    },
  );
}
