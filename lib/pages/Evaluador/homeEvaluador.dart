// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminata.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/widgets/customaoobarEvaluador.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({Key? key}) : super(key: key);

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final usuario = loginProvider.usuarios[0];
    print("imaggen en el homeEvaluador");
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
        backgroundColor: Colors.white,
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
          inputLogin("Recomendaciones generales"),
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
                      onPressed: () {
                        
                      },
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
      bottomNavigationBar: bottombar2(context, 1),
    );
  }
}

Widget blueSquare({
  required String text,
  required String imagePath,
  required Size size,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            imagePath,
            width: 90,
            height: 60,
          ),
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(11, 35, 173, 1),
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
