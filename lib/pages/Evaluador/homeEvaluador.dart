import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';
import 'package:vitalmovecbi/provider/configuracion/publicaciones/publicacionesFromProvider.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({Key? key}) : super(key: key);

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

File? _imgperfil;
Uint8List webImage = Uint8List(8);

class _HomeEvaluadorState extends State<HomeEvaluador> {
  TextEditingController _recomendacionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final fromProvider =
        Provider.of<PublicacionFromProvider>(context, listen: false);

    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    final usuario = loginProvider.usuarios[0];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/configuracion');
              },
              icon: const Icon(
                Icons.settings,
                color: Colores.primaryColor,
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        title: Image.asset("img/Logo.png", fit: BoxFit.contain),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              "${usuario.nombres} ${usuario.apellidos}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${usuario.dni}"),
            leading: CircleAvatar(
              backgroundImage: usuario.imgperfil != null
                  ? NetworkImage(usuario.imgperfil!, scale: 1.0)
                  : const NetworkImage("img/Usuario/usu2.png")
                      as ImageProvider<Object>,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _mostrarModal(fromProvider);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Escribe tu recomendacion",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: (darkModeProvider.isDarkModeEnabled)
                          ? Colors.white
                          : Colors.black,
                    )),
                SizedBox(width: 5),
                Icon(Icons.edit),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Recomendaciones del dia",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 30),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Título",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Peso saludable Si le es difícil controlar su peso, ciertamente no está solo en el mundo actual. De hecho, más del 39 por ciento de los adultos en los Estados Unidos tienen obesidad.1 El exceso de peso puede causar enfermedades del corazón, diabetes tipo 2, enfermedad renal y otros problemas de salud crónicos. Establecer metas para mejorar su salud puede ayudarle a reducir la probabilidad de desarrollar problemas de salud relacionados con el peso.",
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 180,
                  child: Container(
                    margin: const EdgeInsets.all(9.0),
                    child: Image.asset(
                      "img/caminar.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Fecha de publicación: 04/03/2024",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _pickImageGallery(PublicacionFromProvider fromProvider) async {
    if (!kIsWeb) {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;

      setState(() {
        _imgperfil = File(returnedImage.path);
        fromProvider.imagen = _imgperfil;
      });
    } else if (kIsWeb) {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      _imgperfil = File(returnedImage.path);
      var f = await returnedImage.readAsBytes();
      setState(() {
        webImage = f;
        fromProvider.imagen = null;
      });
    }
  }

  void _mostrarModal(PublicacionFromProvider fromProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ingrese su recomendación"),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Consumer(
              builder: (context, value, child) => TextField(
                onChanged: (value) => fromProvider.recomendaciones,
                controller: _recomendacionController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Escriba su recomendación aquí",
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                _pickImageGallery(fromProvider);
                Navigator.of(context).pop();
              },
              child: const Column(
                children: [
                  Icon(Icons.photo_library),
                  Text('Galería'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _recomendacionController.clear();
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Cancelar",
                    //style: TextStyle(color: Color.fromRGBO(196, 12, 12, 1)),
                  ),
                  Icon(Icons.cancel, color: Color.fromRGBO(196, 12, 12, 1)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _recomendacionController.clear();
                Navigator.of(context).pop();
                _mostrarNotificacion();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Publicar"),
                  //style: TextStyle(color: Color.fromRGBO(0, 212, 46, 1))),
                  Icon(Icons.check, color: Color.fromRGBO(0, 212, 46, 1)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _mostrarNotificacion() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Publicación exitosa'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
