import 'package:flutter/material.dart';

class UsuarioLogin extends StatelessWidget {
  const UsuarioLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: nav(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: size.width * .1, vertical: size.height * .1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Documento de Identidad",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)),
                    SizedBox(height: 10),
                    inputLogin("Ingrese Documento de Identidad"),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Contraseña",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)),
                    SizedBox(height: 10),
                    inputLogin("Ingrese tu contraseña"),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .7, size.height * .07),
                        backgroundColor: Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                        padding: EdgeInsets.all(size.height * .002),
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/homeUsuario');
                    },
                    child: Text('Acceder')),
              ],
            ),
          ),
        ));
  }
}

PreferredSizeWidget nav(context) {
  final size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height * 0.4),
    child: Container(
      width: size.width * 1,
      decoration: BoxDecoration(
        color: Color(0xFFADE8F4),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(size.width * 0.2),
        ),
      ),
      child: Center(
        child: Image.asset("img/logo.png"),
      ),
    ),
  );
}

Widget inputLogin(String campo) {
  return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(34, 174, 174, 174),
          borderRadius: BorderRadius.circular(50)),
      child: TextField(
          cursorColor: Colors.orangeAccent,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none))));
}
