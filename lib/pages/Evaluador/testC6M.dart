// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';
class TestC6M extends StatefulWidget {
  const TestC6M({super.key});
  @override
  State<TestC6M> createState() => _TestC6M();
}

class _TestC6M extends State<TestC6M> {
  List<Persona> personas = [
    Persona("Edison Cuaran", "C.C 1556458585"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Test Caminata (C6M)",
          style: TextStyle(
            color: Color.fromRGBO(
                11, 35, 173, 1), // Cambia aquí el color del texto del nav
          ),
        ),
        backgroundColor: const Color(0xFFADE8F4),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            const SizedBox(height: 50),
            const Text(
              "Usuario seleccionado:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0.1),
                const SizedBox(height: 20),
                Column(
                  children: personas
                      .map((persona) => Column(
                            children: [
                              lista(persona.nombre, persona.cedula),
                              const SizedBox(height: 10),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text("Llene los siguientes campos:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            const SizedBox(
              height: 3,
            ),
            const SizedBox(height: 19),
            inputLogin2("Distancia M"),
            const SizedBox(height: 19),
            inputLogin2("Frecuencia Cardiaca maxima (FCM)"),
            const SizedBox(height: 19),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  _mostrarDialogo(context);
                      },
                child: const Text('Ver resultados'),
              ),
            ),
          ])),
    );
  }
}
void _mostrarDialogo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Guardado exitosamente'),
        content: const Text('Resultados Test De Caminata '),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Realizar Test De Bruce '),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/Bruce');
            },
            child: const Text('Realizar Test De Caminata Nuevamente'),
          ),
        ],
      );
    },
  );
}

