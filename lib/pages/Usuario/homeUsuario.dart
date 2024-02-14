// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          navEvaluador(context, size.height * .35),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 55.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                blueSquare(
                  text: "Estadisticas",
                  imagePath: "img/Usuario/statistics.svg",
                ),
                const SizedBox(width: 50),
                blueSquare(
                  text: "Perfil",
                  imagePath: "img/Usuario/user.svg",
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
                  text: "Perfil",
                  imagePath: "img/Usuario/call.svg",
                ),
                const SizedBox(width: 50),
                blueSquare(
                  text: "Configuracion",
                  imagePath: "img/Evaluador/setting.svg",
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
