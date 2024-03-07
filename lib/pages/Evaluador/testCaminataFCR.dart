// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminata.dart';
import 'package:vitalmovecbi/provider/caminata/ProviderCaminata.dart';

import 'package:vitalmovecbi/provider/caminata/caminataFromProvider.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';

class TestCaminataFCR extends StatefulWidget {
  const TestCaminataFCR({super.key});

  @override
  State<TestCaminataFCR> createState() => _TestCaminataFCR();
}

class _TestCaminataFCR extends State<TestCaminataFCR> {
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();

  // List<Persona> personas = [
  //   Persona("Edison Cuaran", "C.C 1556458585"),

  @override
  Widget build(BuildContext context) {
    final fromProvider =
        Provider.of<CaminataFromProvider>(context, listen: false);
    final provider = Provider.of<ProviderCaminata>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Test Caminata FCR",
          style: TextStyle(
            color: Colores.quaternaryColor,
          ),
        ),
        backgroundColor: Colores.primaryColor,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Usuario seleccionado:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.1),
                SizedBox(height: 20),
                // Column(
                //   children: personas
                //       .map(
                //         (persona) => Column(
                //           children: [
                //             lista(persona.nombre, persona.cedula),
                //             const SizedBox(height: 10),
                //           ],
                //         ),
                //       )
                //       .toList(),
                // ),
              ],
            ),
            const SizedBox(height: 80),
            const Text(
              "Ingrese su frecuencia cardiaca en reposo (FCR):",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(height: 19),
            inputLogin(""),
            Consumer(
              builder: (context, value, child) => InputLogin(
                  onChanged: (value) => fromProvider.fcr = value as double?,
                  campo: "Ingrese FCR",
                  tamano: size.width,
                  tipo: TextInputType.number),
            ),
            const SizedBox(height: 19),
            Consumer(
              builder: (context, value, child) => InputLogin(
                  onChanged: (value) => fromProvider.fcm = value as double?,
                  campo: "Ingrese FCM",
                  tamano: size.width,
                  tipo: TextInputType.number),
            ),
            const SizedBox(height: 19),
            Consumer(
              builder: (context, value, child) => InputLogin(
                  onChanged: (value) => fromProvider.tiempo = value as double?,
                  campo: "Ingrese TIEMPO",
                  tamano: size.width,
                  tipo: TextInputType.number),
            ),
            const SizedBox(height: 19),
            Consumer(
              builder: (context, value, child) => InputLogin(
                  onChanged: (value) =>
                      fromProvider.distancia = value as double?,
                  campo: "Ingrese DISTANCIA",
                  tamano: size.width,
                  tipo: TextInputType.number),
            ),
            const SizedBox(height: 19),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  try {
                    provider.caminata(fromProvider, context);
                  } catch (error) {
                    print('Error al enviar la solicitud: $error');
                  }
                },
                child: const Text('Siguiente'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
