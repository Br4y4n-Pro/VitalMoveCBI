// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
              inputLogin("Ingrese Documento de Identidad"),
              const SizedBox(height: 19),
              const Text("Contraseña",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 3,
              ),
              inputLogin("Ingrese tu contraseña",size.width),
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
                      Navigator.pushReplacementNamed(context, '/homeUsuario');
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

nav(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height * 0.35,
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(size.width * 0.2),
      ),
    ),
    child: Center(
      child: Image.asset("img/logo.png"),
    ),
  );
}

Widget inputLogin(String campo) {
  return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
          cursorColor: const Color.fromARGB(33, 15, 15, 15),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none))));
}

