// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

import '../../widgets/grafico.dart';

class PerfilInformativo extends StatefulWidget {
  const PerfilInformativo({super.key});

  @override
  State<PerfilInformativo> createState() => _PerfilInformativoState();
}

class _PerfilInformativoState extends State<PerfilInformativo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        title: const Text(
          "Ultima Información",
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  textSub("Brayan Alexis Cañas Londoño"),
                  textContent("1193238697"),
                ],
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                ),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/itachi.jpg"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(" Ultima medicion IMC"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Color(0xff0096C7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                        child: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(" Ultima medicion IMC"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xff0096C7),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                        child: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          Container(
            height: 1,
            width: 10,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 150, 199, 1),
            ),
          ),
          const SizedBox(height: 50),
          grafico(context),
          const SizedBox(height: 40),
          Container(
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .2, size.height * .06),
                    backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    padding: EdgeInsets.all(size.height * .002),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pushNamed(context, '/perfil');
                },
                child: const Text('Ver perfil completo')),
          ),
        ],
      ),
    );
  }
}
