// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminata.dart';
import 'package:vitalmovecbi/widgets/customaoobarEvaluador.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({super.key});

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset(
                      "img/Logo.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Color(0xff0096C7),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/configuracion");
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            const ListTile(
              title: Text(
                "Brayan Alexis Cañas Londoño",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("CC 1193238697"),
              leading: CircleAvatar(
                backgroundImage: AssetImage("img/Usuario/usu2.png"),
              ),
            ),
            const SizedBox(height: 30),
            inputLogin("Recomendaciones generales"),
            const SizedBox(height: 30),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Título",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    height: 180, // Ancho deseado de la imagen
                    child: Container(
                      margin: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "img/caminar.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottombar2(context, 1));
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
