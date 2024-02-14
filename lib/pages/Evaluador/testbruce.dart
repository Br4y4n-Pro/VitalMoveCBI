import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/homeEvaluador.dart';

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
          title: Container(
            alignment: const Alignment(-0.3, 1),
            child: const Text(
              "Test Bruce",
              style: TextStyle(
                color: Color.fromRGBO(11, 35, 173, 1),
              ),
            ),
          ),
          backgroundColor: const Color(0xFFADE8F4),
        ),
        body: ListView(children: [
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
                      backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                      foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {},
                  child: const Text('Buscar')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/pageTestB');
                      },
                      child: SizedBox(
                        height: 80,
                        width: 290, // Ajusta el ancho del cuadro aquí
                        child: blueSquare(
                          text: "Mauricio Patricio Herrera",
                          imagePath: "img/Evaluador/bruce.svg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]));
  }
}

Widget inputLogin(String campo) {
  return Container(
      width: 300,
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
