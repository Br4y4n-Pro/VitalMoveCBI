import 'package:flutter/material.dart';

class HomeUsuario extends StatefulWidget {
  const HomeUsuario({super.key});

  @override
  State<HomeUsuario> createState() => _HomeUsuarioState();
}

class _HomeUsuarioState extends State<HomeUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("home Usuario"),
      ),
    );
  }
}
