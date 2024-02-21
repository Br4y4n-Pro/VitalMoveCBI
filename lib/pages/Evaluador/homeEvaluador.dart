import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitalmovecbi/pages/Evaluador/testbruce.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/customaoobarEvaluador.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';
// ignore: unused_import
import 'package:vitalmovecbi/widgets/navap.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({super.key});

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
                    Spacer(),
                    Image.asset(
                      "img/Logo.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
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
=======
    final size = MediaQuery.of(context).size;
    return SafeArea(
<<<<<<< HEAD
      child: Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pageTests');
                  },
                  child: blueSquare(
                      text: "Tests",
                      imagePath: "img/Evaluador/test.svg",
                      size: size)),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pageTestB');
                  },
                  child: blueSquare(
                      text: "Lista usuarios",
                      imagePath: "img/Evaluador/groupuser.svg",
                      size: size)),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registerUser');
                  },
                  child: blueSquare(
                      text: "Crear usuario",
                      imagePath: "img/Evaluador/user_add.svg",
                      size: size)),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/configuracion');
                  },
                  child: blueSquare(
                      text: "Configuracion",
                      imagePath: "img/Evaluador/setting.svg",
                      size: size)),
            ]),
=======
        child: Scaffold(
      body:  GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
>>>>>>> 14da74b4ba4e006dfd64811fe6305b165e96340b
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Título",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Peso saludable Si le es difícil controlar su peso, ciertamente no está solo en el mundo actual. De hecho, más del 39 por ciento de los adultos en los Estados Unidos tienen obesidad.1 El exceso de peso puede causar enfermedades del corazón, diabetes tipo 2, enfermedad renal y otros problemas de salud crónicos. Establecer metas para mejorar su salud puede ayudarle a reducir la probabilidad de desarrollar problemas de salud relacionados con el peso.",
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 180, // Ancho deseado de la imagen
                  child: Container(
                    margin: EdgeInsets.all(9.0),
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
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
      ),
         bottomNavigationBar: bottombar2(context, 1)
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

zxczxc