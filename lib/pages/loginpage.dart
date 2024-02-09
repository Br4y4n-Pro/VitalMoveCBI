
    

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: nav(context),

      body: Center(

        child: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset("img/LogoCBI.png"),
               ),
               ),

            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * .8, size.height * .07),
                backgroundColor: Color.fromRGBO(0, 150, 199, 1),
                foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                padding: EdgeInsets.all(size.height * .020),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/evaluador');
              },
              child: const Text('Evaluador'),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * .8, size.height * .07),
                backgroundColor: Color.fromARGB(255, 0, 181, 241),
                foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                padding: EdgeInsets.all(size.height * .015),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/usuarioLogin');
              },
              child: const Text('Usuario'),
            ),

             SizedBox(
              height: size.height * 0.11,
            ),

                  const Expanded(
                    child: SingleChildScrollView(
                      child: Align(
                      alignment: Alignment.bottomCenter,
                       child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '© 2024 ADSO. Todos los derechos reservados. Prohibida la reproducción sin autorización.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 8, 8, 8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
                  ),

    
          ],
        ),
      ),
    );
  }
}


PreferredSizeWidget nav(context) {
  final size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height * 0.4),
    child: Container(
      width: size.width * 1,
      decoration: BoxDecoration(
       image: const DecorationImage(image: AssetImage("img/fondoPrincipal.jpg"),fit:BoxFit.cover ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(size.width * 0.2),
        ),
      ),
    ), 
  );
}
