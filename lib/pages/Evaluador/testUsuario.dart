import 'package:flutter/material.dart';

class Persona {
  final String nombre;
  final String cedula;

  Persona(this.nombre, this.cedula);
}

class TestUsuario extends StatefulWidget {
  const TestUsuario({Key? key}) : super(key: key);
  @override
  State<TestUsuario> createState() => _TestUsuario();
}

class _TestUsuario extends State<TestUsuario> {
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
          title: Container(
            child: const Text(
              "Usuario",
              style: TextStyle(
                color: Color.fromRGBO(
                    11, 35, 173, 1), // Cambia aquí el color del texto del nav
              ),
            ),
          ),
          backgroundColor: const Color(0xFFADE8F4),
        ),
        body: ListView());
  }
}
