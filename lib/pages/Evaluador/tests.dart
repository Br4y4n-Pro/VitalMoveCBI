import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/homeEvaluador.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

import 'package:vitalmovecbi/widgets/customaoobarEvaluador.dart';

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
         bottomNavigationBar: bottombar2(context, 2)),
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
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/pageTestC');
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * .1),
                height: 70,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage("img/caminar.jpg"),
                      fit: BoxFit.fitWidth,
                    )),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.black.withOpacity(.5),
                    ),
                    child: const Center(
                      child: Text(
                        "Test de Caminata 6 min",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ))),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/pageTestB');
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * .1),
                height: 70,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage("img/bruce.jpg"),
                      fit: BoxFit.fitWidth,
                    )),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.black.withOpacity(.5),
                    ),
                    child: const Center(
                      child: Text(
                        " Test de Bruce",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ))),
          ),
    ],
    
  );
}
