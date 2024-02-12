import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/homeEvaluador.dart';

class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            "Tests",
            style: TextStyle(
              color: Color.fromRGBO(11, 35, 173, 1), // Cambia aquí el color del texto del nav
            ),
          ),
        ),
        backgroundColor: const Color(0xFFADE8F4),
      ),
      body: ListView (
        children: [
          SizedBox(height: 80), // Espacio entre el nav y el texto
          Text(
            "Seleccione el test que se va a realizar:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18, // Puedes ajustar el tamaño del texto aquí
            ),
          ),
          SizedBox(height: 20), // Espacio entre el texto y el primer cuadro
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230, // Ajusta el ancho del cuadro aquí
                  child: blueSquare(
                    text: "Test de Bruce modificado",
                    imagePath: "img/TestB.png",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230, // Ajusta el ancho del cuadro aquí
                  child: blueSquare(
                    text: "Test de caminata 6 minutos",
                    imagePath: "img/TestC.png",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
