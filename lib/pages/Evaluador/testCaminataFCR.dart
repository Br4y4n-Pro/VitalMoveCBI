import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';
class TestCaminataFCR extends StatefulWidget {
  const TestCaminataFCR({Key? key}) : super(key: key);
  @override
  State<TestCaminataFCR> createState() => _TestCaminataFCR();
}

class _TestCaminataFCR extends State<TestCaminataFCR> {
  List<Persona> personas = [
    Persona("Edison Cuaran", "C.C 1556458585"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: const Text(
            "Test Caminata FCR",
            style: TextStyle(
              color: Color.fromRGBO(
                  11, 35, 173, 1), // Cambia aquí el color del texto del nav
            ),
          ),
        ),
        backgroundColor: const Color(0xFFADE8F4),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
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
                              SizedBox(height: 10),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text("Ingrese su frecuencia cardiaca en reposo (FCR):",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            const SizedBox(
              height: 3,
            ),
            const SizedBox(height: 19),
            inputLogin2("Ingrese FCR"),
            const SizedBox(height: 19),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 170),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 50),
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
                  Navigator.pushNamed(context, '/pageTestC6M');
                },
                child: const Text('Siguiente'),
              ),
            ),
          ])),
    );
  }
}
