// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/testbruce.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';


class Persona {
  final String nombre;
  final String cedula;

  Persona(this.nombre, this.cedula);
}

class TestCaminata extends StatefulWidget {
  const TestCaminata({super.key});

  @override
  State<TestCaminata> createState() => _TestCaminata();
}

class _TestCaminata extends State<TestCaminata> {
  List<Persona> personas = [
    Persona("Edison Cuaran", "C.C 1556458585"),
    Persona("Juan Perez", "C.C 123456789"),
    Persona("Maria Gomez", "C.C 987654321"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Test Caminata",
          style: TextStyle(
            color: Colores.quaternaryColor,
          ),
        ),
        backgroundColor: Colores.primaryColor,
        elevation: 1,
          iconTheme: const IconThemeData(color: Colores.quaternaryColor),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Buscar Persona:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                inputLogin("Cedula o Nombre"),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(160, 50),
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
                  Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Buscar'),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 1.5,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 150, 199, 1),
                  ),
                ),
                const SizedBox(height: 20),
            Column(
  children: personas
      .map((persona) => GestureDetector(
            onTap: () {
              if (persona.nombre == "Edison Cuaran") {
                Navigator.pushNamed(context, '/pageTestCaminataFCR');
              } else if (persona.nombre == "Juan Perez") {
                Navigator.pushNamed(context, '/ruta_juan');
              } else if (persona.nombre == "Maria Gomez") {
                Navigator.pushNamed(context, '/ruta_maria');
              }
            },
            child: Column(
              children: [
                lista(persona.nombre, persona.cedula),
                const SizedBox(height: 10),
              ],
            ),
          ))
      .toList(),
),
              ],
            ),
          ],
        ),
      ),
        bottomNavigationBar: bottombar(context, 1));
  }
}

Widget inputLogin(String campo) {
  return Container(
    width: 350,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 240, 240, 240),
      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      cursorColor: const Color.fromARGB(33, 15, 15, 15),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontStyle: FontStyle.normal,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: campo,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}