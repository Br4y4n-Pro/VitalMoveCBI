// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AcercaDe extends StatefulWidget {
  const AcercaDe({super.key});
  @override
  State<AcercaDe> createState() => _AcercaDe();
}

class _AcercaDe extends State<AcercaDe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Acerca De",
            style: TextStyle(
              color: Color.fromRGBO(
                  11, 35, 173, 1), // Cambia aquí el color del texto del nav
            ),
          ),
          backgroundColor: const Color(0xFFADE8F4),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: const [
            SizedBox(height: 50),
            Text(
              "VitalMove es una app movil para registrar y calcular el progreso de diferentes activades realizadas por una persona con el fin de ayudarle a que adopte mejores habitos para tener un vida más saludable.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Hecho Por:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "        Brayan Cañas                 brayan@gmail.com",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "        Edison Cuaran                 edison@gmail.com",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "        Jennifer Yara                 jennifer@gmail.com",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "         Lisimaco Mendez         lisimaco@gmail.com",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ));
  }
}
