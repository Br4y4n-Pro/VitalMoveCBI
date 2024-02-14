// ignore_for_file: file_names

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
      appBar: AppBar(title: const Text('Home De Evaluador')),
      body: const Center(
        child: Text('Home Evaluador'),
      ),
    );
  }
}
