import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/homeEvaluador.dart';
import 'package:vitalmovecbi/pages/Evaluador/testbruce.dart';

class AcercaDe extends StatefulWidget {
  const AcercaDe({Key? key}) : super(key: key);
  @override
  State<AcercaDe> createState() => _AcercaDe();
}

class _AcercaDe extends State<AcercaDe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: const Text(
              "Acerca De",
              style: TextStyle(
                color: Color.fromRGBO(
                    11, 35, 173, 1), // Cambia aquí el color del texto del nav
              ),
            ),
          ),
          backgroundColor: const Color(0xFFADE8F4),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            const SizedBox(height: 50),
            const Text(
              "VitalMove es una app movil para registrar y calcular el progreso de diferentes activades realizadas por una persona con el fin de ayudar a que la persona adopte mejores habitos para tener un vida mas saludable.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Hecho Por:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "        Brayan Cañas                 brayan@gmail.com",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "        Edison Cuaran                 edison@gmail.com",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "        Jennifer Yara                 jennifer@gmail.com",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
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
