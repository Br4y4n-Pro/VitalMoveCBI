import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class PerfilVista extends StatefulWidget {
  const PerfilVista({Key? key});

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
                  textField("Nombres y apellidos", "Brayan Alexis Cañas Londoño"),
                  const SizedBox(height: 15),
                  textField("Documento de Identidad", "1193238697"),
                  const SizedBox(height: 15),
                  textField("Fecha de Nacimiento", "19/09/99"),
                  const SizedBox(height: 15),
                  textField("Género", "M"),
                  const SizedBox(height: 15),
                  textField("Tipo de Sangre", "O+"),
                  const SizedBox(height: 15),
                  textField("Dirección", "Calle 23a # 28 - 18"),
                  const SizedBox(height: 15),
                  textField("EPS(Entidad de salud)", "Salud Total"),
                  const SizedBox(height: 15),
                  textField("Alergias", "Ninguna"),
                  const SizedBox(height: 15),
                  textField("IMC", "19.35 Normal"),
                  const SizedBox(height: 15),
                  textField("Grupo", "1"),
                  const SizedBox(height: 15),
                  textField("Peso (KG)", "60 Kg"),
                  const SizedBox(height: 15),
                  textField("Talla (Metros)", "1.77 Metros"),
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
        bottomNavigationBar: bottombar(context, 4),
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
