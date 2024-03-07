import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/RegistroUsuario.dart';
import 'package:vitalmovecbi/pages/Evaluador/Regdos.dart';
import 'package:vitalmovecbi/pages/Evaluador/actiSema.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key});

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final controller = PageController(initialPage: 0);
  int _currentPageIndex = 0;

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
            color: Colores.quaternaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                RegistroUsuario(),
                RegistroUserdos(),
                RegistroUsertres(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_currentPageIndex > 0)
                Container(
                  decoration: BoxDecoration(
                    color: _currentPageIndex == 0 ? Colors.white : null,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colores.primaryColor, // Cambia el color del botón
                    ),
                    child: const Text('Anterior',
                        style: TextStyle(
                          color: Colores.quaternaryColor,
                          fontWeight: FontWeight.w500,
                        )), // Cambia el color del texto
                  ),
                ),
              const SizedBox(width: 16),
              if (_currentPageIndex <
                  2) // Mostrar el botón "Siguiente" solo si no estás en la última página
                ElevatedButton(
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                    
=======
>>>>>>> 4929072240871fd2f7018d4424934000b90f0c2f
                    backgroundColor:
                        Colores.primaryColor, // Cambia el color del botón
                  ),
                  child: const Text('Siguiente',
                      style: TextStyle(
                        color: Colores.quaternaryColor,
                        fontWeight: FontWeight.w500,
                      )), // Cambia el color del texto
                ),
            ],
          ),
     
        ],
      ),
    );
  }
}
