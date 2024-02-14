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
          alignment: const Alignment(-0.2, 1),
          child: const Text(
            "Tests",
            style: TextStyle(
              color: Color.fromRGBO(
                  11, 35, 173, 1), // Cambia aquí el color del texto del nav
            ),
          ),
        ),
        backgroundColor: const Color(0xFFADE8F4),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 80), // Espacio entre el nav y el texto
          const Text(
            "Seleccione el test que se va a realizar:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20, // Puedes ajustar el tamaño del texto aquí
            ),
          ),
          const SizedBox(
              height: 20), // Espacio entre el texto y el primer cuadro
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pageTestB');
                  },
                  child: SizedBox(
                    width: 230, // Ajusta el ancho del cuadro aquí
                    child: blueSquare(
                      text: "Test de Bruce modificado",
                      imagePath: "img/Evaluador/bruce.svg",
                    ),
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
                    imagePath: "img/Evaluador/test.svg",
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
