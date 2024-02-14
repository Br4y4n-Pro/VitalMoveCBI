// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/textperfil2.dart';


class AcercaDe extends StatefulWidget {
  const AcercaDe({super.key});

  @override
  State<AcercaDe> createState() => _AcercaDe();
}

class _AcercaDe extends State<AcercaDe> {
  int _paginaActual = 0;
  final telefono = 3245243933.toString();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Acerca de ")),
          backgroundColor: const Color(0xffADE8F4),
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.home_outlined)),
        ),
        body: Container(
          margin:
              EdgeInsets.symmetric(vertical: 10, horizontal: size.width * .1),
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Abuelos es una app movil para registrar y calcular el progreso de diferentes activades realizadas por una persona con el fin de ayudar a que la persona adopte mejores habitos para tener un vida mas saludable.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  textSub2("Hecho por"),
                  
                  const SizedBox(height: 10),
                  
                  textContent2("Brayan Cañas"),
                  const SizedBox(height: 10),
                  
                  textContent2("Edison Cuaran"),
                  const SizedBox(height: 10),

                   textContent2("Jennifer Yara"),
                  const SizedBox(height: 10),

                    textContent2("Jennifer Yara"),
                  const SizedBox(height: 10),
                ],
                
              ),
              const SizedBox(height: 40),
              // 
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _paginaActual = index;
                if (_paginaActual == 0) {
                  Navigator.pushReplacementNamed(context, '/homeUsuario');
                } else if (_paginaActual == 1) {
                  Navigator.pushReplacementNamed(context, '/contact');
                } else {
                  Navigator.pushReplacementNamed(context, '/perfil');
                }
              });
            },
            currentIndex: 1,
            elevation: 1,
            backgroundColor: const Color(0xffADE8F4),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Principal"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone_in_talk), label: "Llamada"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Perfil"),
            ]),
      ),
    );
  }
}
