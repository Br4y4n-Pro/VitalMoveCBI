import 'package:flutter/material.dart';
<<<<<<< HEAD
// import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
// import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';
=======
import 'package:vitalmovecbi/index.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';
>>>>>>> fc67b04f437aaf45b2a84c2034022013a4e8f146

class Configuracion extends StatefulWidget {
  const Configuracion({Key? key}) : super(key: key);

  @override
  _ConfiguracionState createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        title: const Text(
          "Configuración",
          style: TextStyle(color: Colores.quaternaryColor),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: size.width * .1),
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Consumer<DarkModeProvider>(
                  builder: (context, darkModeProvider, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Modo Oscuro",
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.brightness_4_outlined, size: 20),
                          ],
                        ),
                        Switch(
                          value: darkModeProvider.isDarkModeEnabled,
                          onChanged: (value) {
                            darkModeProvider.toggleDarkMode(value);
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
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
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Acerca de",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.info_outline)
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * .5, size.height * .07),
                  backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
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