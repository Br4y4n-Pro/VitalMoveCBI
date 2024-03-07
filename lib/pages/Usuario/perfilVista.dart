// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
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
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final usuario = loginProvider.usuarios[0];

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
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colores.primaryColor,
        ),
        body: ListView(
          children: [
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
                  textField("Nombres y apellidos",
                      "${usuario.nombres} ${usuario.apellidos}"),
                  const SizedBox(height: 15),
                  textField("Documento de Identidad", "${usuario.dni}"),
                  const SizedBox(height: 15),
                  textField(
                      "Fecha de Nacimiento", "${usuario.fechaNacimiento}"),
                  const SizedBox(height: 15),
                  textField("Género", "${usuario.genero}"),
                  const SizedBox(height: 15),
                  textField("Tipo de Sangre", "${usuario.rh}"),
                  const SizedBox(height: 15),
                  textField("Dirección", "${usuario.direccion}"),
                  const SizedBox(height: 15),
                  textField("EPS(Entidad de salud)", "${usuario.eps}"),
                  const SizedBox(height: 15),
                  textField("Alergias", "${usuario.alergias}"),
                  const SizedBox(height: 15),
                  textField("IMC", "${usuario.actividadsemana}"),
                  const SizedBox(height: 15),
                  textField("Grupo", "${usuario.grupo}"),
                  const SizedBox(height: 15),
                  textField("Peso (KG)", "${usuario.peso}"),
                  const SizedBox(height: 15),
                  textField("Talla (Metros)", "${usuario.talla}"),
                  const SizedBox(height: 25),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .5, size.height * .05),
                        backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/perfilInformativo');
                      },
                      child: const Text(
                        'Ver Estadisticas',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(String labelText, String initialValue) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
