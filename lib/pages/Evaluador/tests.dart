import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/homeEvaluador.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';

class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
            title: const Text(
              "Tests",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            backgroundColor: const Color(0xFFADE8F4),
          ),
          body: seleccionTests(context),
          bottomNavigationBar: bottombar()),
    );
  }
}

// Widget customTapBar(context) {
//   return Stack(
//     Positioned(
//       bottom: 0,
//       child: Container(
//         height: 90,
//         width: 300,
//         decoration: BoxDecoration(color: Colors.cyan),
//       ),
//     ),
//   );
// }

// icon: Icon(Icons.search, color: _selectedIndex == 1 ? Colors.blue : Colors.white), // Cambia el color según la pantalla seleccionada
// guardar para cuando se haga la navegavilidad entre estos botones

Widget seleccionTests(context) {
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
  );
}
