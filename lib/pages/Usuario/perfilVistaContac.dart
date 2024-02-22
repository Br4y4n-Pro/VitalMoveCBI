// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';

class PerfilVistaContact extends StatefulWidget {
  const PerfilVistaContact({super.key});

  @override
  State<PerfilVistaContact> createState() => _PerfilVistaContactState();
}

class _PerfilVistaContactState extends State<PerfilVistaContact> {
  int _paginaActual = 0;
  final telefono = 3245243933.toString();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text("Datos Personales")),
              backgroundColor: const Color(0xffADE8F4),
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.home_outlined)),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10, horizontal: size.width * .1),
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      "Datos Persona de Emergencia",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      textSub("Nombre Completo"),
                      textContent("Kakaroto"),
                      const SizedBox(height: 15),
                      textSub("Parentesco"),
                      textContent("Padre"),
                      const SizedBox(height: 15),
                      textSub("Telefono"),
                      textContent("3245243934"),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width * .5, size.height * .06),
                            backgroundColor:
                                const Color.fromRGBO(0, 150, 199, 1),
                            foregroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () async {
                          final Uri url = Uri(scheme: 'tel', path: telefono);
                          await launchUrl(url);
                          if (await launchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            // ignore: avoid_print
                            print("No se pudo hacer la llamada");
                          }
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.phone_in_talk),
                            Text(
                              'Llamar',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/perfil');
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 40,
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/perfil');
                            },
                            icon: const Icon(
                              Icons.circle_outlined,
                              size: 10,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/contact');
                              },
                              icon: const Icon(
                                Icons.circle_rounded,
                                size: 10,
                              )),
                        ],
                      ),
                      const SizedBox(height: 40, width: 40),
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: bottombar(context, 2)));
  }
}
