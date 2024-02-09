import 'package:flutter/material.dart';

class EvaluadorLogin extends StatelessWidget {
  const EvaluadorLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: nav(context),
      body: Center(
        child: Column(
          children: [
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset("img/Logo.png"),
                ),
                Text(
                  "Codigo de evaluador",
                  style: TextStyle(
                      fontSize: 20, 
                      color: Color.fromARGB(237, 3, 5, 94),
                      fontWeight:FontWeight.w800
                      ),
                ),
                inputLogin("Ingrese codigo de evaluador"),
              ],
            )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .7, size.height * .08),
                    backgroundColor: Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                    padding: EdgeInsets.all(size.height * .025),
                    textStyle: TextStyle(
                        fontSize: size.aspectRatio * 30,
                        fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/evaluadorHome');
                },
                child: Text('Ingresar')),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget nav(context) {
  final size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height * 0.3),
    child: Container(
      width: size.width * 1,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("img/fondoPrincipal.jpg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(size.width * 0.2),
        ),
      ),
    ),
  );
}

Widget inputLogin(String campo) {
  return Container(
      width: 320,
      decoration: BoxDecoration(
          color: const Color.fromARGB(34, 174, 174, 174),
          borderRadius: BorderRadius.circular(50)),
      child: TextField(
          cursorColor: Colors.orangeAccent,
          decoration: InputDecoration(
              hintText: campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none))));
}
