import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/homeEvaluador.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';

class Tests extends StatefulWidget {
  const Tests({super.key});

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colores.quaternaryColor),
            title: const Text(
              "Tests",
              style: TextStyle(
                  color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colores.primaryColor,
          ),
          body: seleccionTests(context),
          bottomNavigationBar: bottombar(context, 1)),
    );
  }
}



Widget seleccionTests(context) {
  final size = MediaQuery.of(context).size;

  return ListView(
    children: [
      const SizedBox(height: 80), // Espacio entre el nav y el texto
      const Text(
        "Seleccione el test que se va a realizar:",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20, // Puedes ajustar el tamaño del texto aquí
        ),
      ),
      const SizedBox(height: 20), // Espacio entre el texto y el primer cuadro
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/TB');
              },
              child: SizedBox(
                width: 230, // Ajusta el ancho del cuadro aquí
                child: blueSquare(
                    text: "Test de Bruce modificado",
                    imagePath: "img/Evaluador/bruce.svg",
                    size: size),
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
             GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageTestC');
              },
            child: SizedBox(
              width: 230, // Ajusta el ancho del cuadro aquí
              child: blueSquare(
                  text: "Test de caminata 6 minutos",
                  imagePath: "img/Evaluador/test.svg",
                  size: size),
            ),
             ),
          ],
        ),
      ),
    ],
  );
}
