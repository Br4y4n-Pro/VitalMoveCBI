import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .7, size.height * .08),
                    backgroundColor: Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                    padding: EdgeInsets.all(size.height * .025),
                    textStyle: TextStyle(
                        fontSize: size.aspectRatio * 60,
                        fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/evaluadorHome');
                },
                child: Text('Evaluador')),
            SizedBox(
              height: size.height * 0.09,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .7, size.height * .08),
                    backgroundColor: Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                    padding: EdgeInsets.all(size.height * .025),
                    textStyle: TextStyle(
                        fontSize: size.aspectRatio * 60,
                        fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pushNamed(context, '/usuarioLogin');
                },
                child: Text('Usuario')),
          ],
        ),
      ),
    );
  }
}
