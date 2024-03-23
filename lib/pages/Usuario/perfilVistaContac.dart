// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class PerfilVistaContact extends StatefulWidget {
  const PerfilVistaContact({super.key});

  @override
  State<PerfilVistaContact> createState() => _PerfilVistaContactState();
}

class _PerfilVistaContactState extends State<PerfilVistaContact> {
  final telefono = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final usuario = loginProvider.usuarios[0];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Contacto',
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: size.width * .1),
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Datos Persona de Emergencia",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                textSub("Nombre Completo"),
                textContent("${usuario.nombreEmergencia}"),
                const SizedBox(height: 15),
                textSub("Parentesco"),
                textContent("${usuario.parentesco}"),
                const SizedBox(height: 15),
                textSub("Teléfono"),
                textContent("${usuario.telefonoEmergencia}"),
                const SizedBox(height: 15),
              ],
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * .5, size.height * .06),
                      backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                      foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () async {
                    final Uri url =
                        Uri(scheme: 'tel', path: usuario.telefonoEmergencia);
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
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
