// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';

class BuscarPersona extends StatefulWidget {
  const BuscarPersona({super.key});

  @override
  State<BuscarPersona> createState() => _BuscarPersonaState();
}

class _BuscarPersonaState extends State<BuscarPersona> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Buscar Persona",
          style: TextStyle(
            color: Color.fromRGBO(
                11, 35, 173, 1), // Cambia aquí el color del texto del nav
          ),
        ),
        backgroundColor: const Color(0xFFADE8F4),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 60),
          inputLogin(
            "Cedula  ò Nombre ",
          ),
          const SizedBox(height: 60),
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
                onPressed: () {},
                child: const Text('Buscar')),
          ),
          const SizedBox(height: 50),
          Container(
            height: 1,
            width: 10,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 150, 199, 1),
            ),
          ),
          const SizedBox(height: 40),
          const Center(
            child: Text("No hay ningún usuario",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          )
        ],
      ),
    );
  }
}

zxczxczx