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
          alignment: Alignment.center,
          child: const Text(
            "Test Bruce",
            style: TextStyle(
              color: Color.fromRGBO(11, 35, 173, 1),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFADE8F4),
      ),
      body: ListView (
        children: [
          SizedBox(height: 30),
          Text(
            "Buscar Persona:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20, 
            ),
          ),
            Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(height: 20),
                 inputLogin("Cedula o Nombre"),
                 SizedBox(height: 20),
               ],
             ),
             

        ]
      )
    );
  }
}
Widget inputLogin(String campo) {
 return Container(
      width: 300,
       decoration: BoxDecoration(
           color: Color.fromARGB(255, 240, 240, 240),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
          cursorColor: Color.fromARGB(33, 15, 15, 15),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.normal,
                   fontSize: 14),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: campo,
            border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none))));
}