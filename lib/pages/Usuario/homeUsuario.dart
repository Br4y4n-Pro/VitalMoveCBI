// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/grafico.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  var position = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              false, // Evita que aparezca la flecha de retorno

          centerTitle: true,
          title: const Text(
            "Principal",
            style: TextStyle(color: Colores.quaternaryColor),
          ),
          backgroundColor: Colores.primaryColor,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            const ListTile(
              title: Text(
                "Brayan Alexis Cañas Londoño",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("CC 1193238697"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage("img/Usuario/usu2.png")),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(" Ultima medicion IMC"),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
            const SizedBox(height: 30),
            Container(
              height: 1,
              width: 10,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 150, 199, 1),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: size.height * .2,
              decoration: BoxDecoration(
                  color: Colores.quaternaryColor,
                  border: Border.all(
                    color: Colores.tertiaryColor,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              // child: ,
            ),
            const SizedBox(height: 20),
            grafico(context),
            const SizedBox(height: 40),
          ],
        ),
        bottomNavigationBar: bottombar(context, 1));
  }
}
