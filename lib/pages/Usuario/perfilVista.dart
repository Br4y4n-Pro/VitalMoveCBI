// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class PerfilVista extends StatefulWidget {
  const PerfilVista({super.key});

  @override
  State<PerfilVista> createState() => _PerfilVistaState();
}

class _PerfilVistaState extends State<PerfilVista> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colores.quaternaryColor),  
              title: const Text(
                'Datos Personales',
                style: TextStyle(
                    color: Colores.quaternaryColor,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: Colores.primaryColor,
            ),
            body: ListView(children: [
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                ),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/itachi.jpg"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * .1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    textSub("Nombres"),
                    textContent("Brayan Alexis"),
                    const SizedBox(height: 10),
                    textSub("Apellidos"),
                    textContent("Cañas Londoño"),
                    const SizedBox(height: 10),
                    textSub("Documento de Identidad"),
                    textContent("1193238697"),
                    const SizedBox(height: 10),
                    textSub("Fecha de Naciemiento"),
                    textContent("19/09/99"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [textSub("Genero"), textContent("M")],
                        ),
                        Column(
                          children: [
                            textSub("Tipo de Sangre"),
                            textContent("o+")
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    textSub("Dirección"),
                    textContent("Calle 23a # 28 - 18"),
                    const SizedBox(height: 10),
                    textSub("EPS(Entidad de salud)"),
                    textContent("Salud Total"),
                    const SizedBox(height: 10),
                    textSub("Alergias"),
                    textContent("Ninguna"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            textSub("IMC"),
                            textContent("19.35 Normal")
                          ],
                        ),
                        Column(children: [textSub("Grupo 1")])
                      ],
                    ),
                    const SizedBox(height: 10),
                    textSub("Peso (KG)"),
                    textContent("60 Kg"),
                    const SizedBox(height: 10),
                    textSub("Talla (Metros)"),
                    textContent("1.77 Metros"),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width * .5, size.height * .05),
                            backgroundColor:
                                const Color.fromRGBO(0, 150, 199, 1),
                            foregroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/estadisticas');
                        },
                        child: const Text(
                          'Ver Estadisticas',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 40, width: 40),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/perfil');
                                },
                                icon: const Icon(
                                  Icons.circle_rounded,
                                  size: 10,
                                )),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/contact');
                              },
                              icon: const Icon(
                                Icons.circle_outlined,
                                size: 10,
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/contact');
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 40,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ]),
            bottomNavigationBar: bottombar(context, 4)));
  }
}
