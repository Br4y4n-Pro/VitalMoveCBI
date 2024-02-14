// ignore: file_names
import 'package:flutter/material.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * .7, size.height * .08),
                  backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  padding: EdgeInsets.all(size.height * .025),
                  textStyle: TextStyle(
                      fontSize: size.aspectRatio * 60,
                      fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                Navigator.pushNamed(context, '/perfil');
              },
              child: const Text('Perfil')),
        ),
      ),
    );
  }
}
