// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({Key? key}) : super(key: key);

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          navEvaluador(context, size.height * .35),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 55.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                blueSquare(
                  text: "Tests",
                  imagePath: "img/Tests.png",
                ),
                const SizedBox(width: 50),
                blueSquare(
                  text: "Lista usuarios",
                  imagePath: "img/ListaU.png",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                blueSquare(
                  text: "Crear usuario",
                  imagePath: "img/CrearU.png",
                ),
                const SizedBox(width: 50),
                blueSquare(
                  text: "Configuracion",
                  imagePath: "img/Configuracion.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget navEvaluador(context, double height) {
  final size = MediaQuery.of(context).size;

  return Container(
    width: size.width,
    height: height,
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(size.width * 0.2),
      ),
    ),
    child: Center(
      child: Image.asset("img/Logo.png"),
    ),
  );
}

Widget blueSquare({
  required String text,
  required String imagePath,
}) {
  return Container(
    width: 119,
    height: 117,
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        Center(
          child: Image.asset(
            imagePath,
            width: 90,
            height: 60,
          ),
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Color.fromRGBO(11, 35, 173, 1),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
