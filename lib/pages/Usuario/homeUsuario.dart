// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
    //final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset(
                      "img/Logo.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Color(0xff0096C7),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/configuracion");
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
              grafico(context),
              const SizedBox(height: 40),
              const Text(
                "Recomendaciones del dia",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 242, 242),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 12),
                              Text(
                                'Peso saludable',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'El cuerpo cambia a medida que envejecemos. Por ejemplo, si usted no es muy activo, es posible que sus músculos no funcionen tan bien y eso puede afectar su fuerza. Además, es posible que queme menos calorías, especialmente si no hace ninguna actividad física. Con el tiempo, si come y bebe más calorías de las que su cuerpo quema durante la actividad física y la vida diaria, su cuerpo podría almacenar las calorías extras que causan el aumento de peso. El peso extra puede causar sobrepeso u obesidad.',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 48),
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 242, 242),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 12),
                              Text(
                                'Peso saludable',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'El cuerpo cambia a medida que envejecemos. Por ejemplo, si usted no es muy activo, es posible que sus músculos no funcionen tan bien y eso puede afectar su fuerza. Además, es posible que queme menos calorías, especialmente si no hace ninguna actividad física. Con el tiempo, si come y bebe más calorías de las que su cuerpo quema durante la actividad física y la vida diaria, su cuerpo podría almacenar las calorías extras que causan el aumento de peso. El peso extra puede causar sobrepeso u obesidad.',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 48),
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
        bottomNavigationBar: bottombar(context, 1));
  }
}
