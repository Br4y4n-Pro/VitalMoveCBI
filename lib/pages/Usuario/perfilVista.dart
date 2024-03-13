// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/historialModelo.dart';
import 'package:vitalmovecbi/provider/datosGenerales/historialUser.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:intl/intl.dart';

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
    final providerHistorial = Provider.of<HistorialProvider>(context);
    final ultimoHistorial = providerHistorial.historiales.isNotEmpty
        ? providerHistorial.historiales[0]
        : Historial(); // Reemplaza Historial() con el tipo de dato correcto
    String formatearFecha(String fecha) {
      DateTime dateTime = DateTime.parse(fecha);
      String fechaFormateada = DateFormat('yyyy-MM-dd').format(dateTime);
      return fechaFormateada;
    }

    String fechaFormateada = formatearFecha(usuario.fechaNacimiento.toString());

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
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: providerHistorial.historiales.isNotEmpty
                    ? Center(
                        child: ClipOval(
                          child: Image.network(
                            usuario.imgperfil ?? "img/Usuario/usu2.png",
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Image.asset(
                          "img/Usuario/usu2.png",
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
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
                  textField("Fecha de Nacimiento", fechaFormateada),
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
                  textField("IMC",
                      '${double.parse(ultimoHistorial.imc ?? '0').toStringAsFixed(2)}   ${ultimoHistorial.imcdescripcion}'),
                  const SizedBox(height: 15),
                  textField("Grupo", "${usuario.grupo}"),
                  const SizedBox(height: 15),
                  textField("Peso (KG)", ultimoHistorial.peso ?? '0'),
                  const SizedBox(height: 15),
                  textField("Talla (Metros)", "${usuario.talla}"),
                  const SizedBox(height: 25),
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
