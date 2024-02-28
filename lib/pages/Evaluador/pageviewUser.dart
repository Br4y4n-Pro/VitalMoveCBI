import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/RegistroUsuario.dart';
import 'package:vitalmovecbi/pages/Evaluador/Regdos.dart';
import 'package:vitalmovecbi/pages/Evaluador/actiSema.dart';
import 'package:vitalmovecbi/widgets/customaoobarEvaluador.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        title: const Text(
          'Registro de Usuario',
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                RegistroUsuario(),
                RegistroUserdos(),
                RegistroUsertres(),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Centra los elementos horizontalmente
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                SizedBox(width: 100), // Agrega espacio entre los botones
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right),
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
          bottombar2(context, 4),
        ],
      ),
    );
  }
}
