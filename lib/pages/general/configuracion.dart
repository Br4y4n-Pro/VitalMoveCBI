import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colores.quaternaryColor),
          title: const Text("Configuración",
              style: TextStyle(color: Colores.quaternaryColor)),
          backgroundColor: Colores.primaryColor),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: size.width * .1),
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Modo Oscuro",
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.brightness_4_outlined, size: 20),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.toggle_off_outlined,
                        size: 40,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tamaño de letra",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Mediana",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Acerca de",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.info_outline)
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .5, size.height * .07),
                    backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pushNamed(context, '/usuarioLogin');
                },
                child: const Text(
                  'Cerrar Sesion',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
