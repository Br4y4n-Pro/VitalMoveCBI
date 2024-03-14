// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/provider/caminata/ProviderCaminata.dart';
import 'package:vitalmovecbi/provider/caminata/caminataFromProvider.dart';
import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';

class TestCaminataFCR extends StatefulWidget {
  final Usuario? usuario;
  const TestCaminataFCR({super.key, this.usuario});
  @override
  State<TestCaminataFCR> createState() => _TestCaminataFCRState();
}

class _TestCaminataFCRState extends State<TestCaminataFCR> {
  final TextEditingController _recomendacionController =
      TextEditingController();

  void _mostrarModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Agregar Recomendación"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _recomendacionController,
                  decoration: const InputDecoration(
                    labelText: 'Recomendación',
                    hintText: 'Ingrese su recomendación aquí',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                String recomendacion = _recomendacionController.text;
                print('Recomendación agregada: $recomendacion');
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    final size = MediaQuery.of(context).size;
    final fromProvider =
        Provider.of<CaminataFromProvider>(context, listen: false);
    final provider = Provider.of<ProviderCaminata>(context, listen: false);

    final usuario = ModalRoute.of(context)?.settings.arguments as Usuario?;
    if (usuario != null) {
      print("------------");
      print(usuario.toString());
    } else {
      // Manejar el caso en que usuario sea null
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        title: const Text(
          "Test Caminata",
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 30),
          const Text(
            "Usuario seleccionado:",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                color: (darkModeProvider.isDarkModeEnabled)
                    ? Colores.primaryColor
                    : Colores.quaternaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: (usuario?.imgperfil != null)
                    ? NetworkImage(usuario!.imgperfil.toString())
                    : const AssetImage('img/Usuario/usu2.png')
                        as ImageProvider<Object>?,
              ),
              title: Text('${usuario?.nombres} ${usuario?.apellidos}'),
              subtitle: Text('${usuario?.dni}'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.open_with)),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Ingresa Los datos a evaluar ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 19),
          Consumer(
            builder: (context, value, child) => InputLogin(
              onChanged: (value) => fromProvider.fcr = value,
              campo: "Ingrese FCR",
              tamano: size.width,
              tipo: TextInputType.number,
            ),
          ),
          const SizedBox(height: 19),
          Consumer(
            builder: (context, value, child) => InputLogin(
              onChanged: (value) => fromProvider.fcm = value,
              campo: "Ingrese FCM",
              tamano: size.width,
              tipo: TextInputType.number,
            ),
          ),
          const SizedBox(height: 19),
          Consumer(
            builder: (context, value, child) => InputLogin(
              onChanged: (value) => fromProvider.tiempo = value,
              campo: "Ingrese TIEMPO",
              tamano: size.width,
              tipo: TextInputType.number,
            ),
          ),
          const SizedBox(height: 19),
          Consumer(
            builder: (context, value, child) => InputLogin(
              onChanged: (value) => fromProvider.distancia = value,
              campo: "Ingrese DISTANCIA",
              tamano: size.width,
              tipo: TextInputType.number,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => _mostrarModal(context),
                child: const Row(
                  children: [
                    Text(
                      'Añadir Recomendacion',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ],
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
    );
  }
}
