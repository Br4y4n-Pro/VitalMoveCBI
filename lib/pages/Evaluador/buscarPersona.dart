// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/provider/usuarios/providerUsuarios.dart';
import 'package:vitalmovecbi/widgets/InputText.dart';
import 'package:vitalmovecbi/widgets/customaoobarEvaluador.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class BuscarPersona extends StatefulWidget {
  const BuscarPersona({super.key});

  @override
  State<BuscarPersona> createState() => _BuscarPersonaState();
}

class _BuscarPersonaState extends State<BuscarPersona> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UsuarioProvider>(context);
    final size = MediaQuery.of(context).size;
    final usu = provider.allUser(context);
    print(usu);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colores.quaternaryColor),
          title: const Text(
            "Buscar Persona",
            style: TextStyle(
                color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colores.primaryColor,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 60),
            inputLogin("Cedula  ò Nombre ", size.width, TextInputType.name),
            const SizedBox(height: 60),
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * .4, size.height * .06),
                      backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                      foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      padding: EdgeInsets.all(size.height * .002),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {},
                  child: const Text('Buscar')),
            ),
            const SizedBox(height: 50),
            Container(
              height: 1,
              width: 10,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 150, 199, 1),
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text("No hay ningún usuario",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
            )
          ],
        ),
        bottomNavigationBar: bottombar2(context, 3));
  }
}

