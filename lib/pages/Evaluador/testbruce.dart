import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class Testbruce extends StatefulWidget {
  const Testbruce({Key? key}) : super(key: key);

  @override
  State<Testbruce> createState() => _Testbruce();
}

class _Testbruce extends State<Testbruce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Test Bruce",
            style: TextStyle(
              color: Color.fromRGBO(11, 35, 173, 1),
            ),
          ),
          backgroundColor: const Color(0xFFADE8F4),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            const SizedBox(height: 30),
            const Text(
              "Buscar Persona:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                inputLogin("Cedula o Nombre"),
                const SizedBox(height: 40),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(170, 60),
                        backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {},
                    child: const Text('Buscar')),
                const SizedBox(height: 30),
                Container(
                  height: 1.5,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 150, 199, 1),
                  ),
                ),
                const SizedBox(height: 20),
                lista(),
              ],
            ),
          ]),
        ));
  }
}

Widget inputLogin(String campo) {
  return Container(
      width: 350,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
          cursorColor: const Color.fromARGB(33, 15, 15, 15),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none))));
}

Widget lista() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFADE8F4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("img/General/viejito.jpg"),
          ),
          SizedBox(width: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [textSub("Edison Cuaran"), textSub("C.C 1556458585")],
          ),
        ],
      ));
}
