import 'package:flutter/material.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({super.key});

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        nav(context),
      ],
    ));
  }
}

nav(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height * 0.35,
    decoration: BoxDecoration(
      color: Color(0xFFADE8F4),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(size.width * 0.2),
      ),
    ),
    child: Center(
      child: Image.asset("img/Logo.png"),
    ),
  );
}
