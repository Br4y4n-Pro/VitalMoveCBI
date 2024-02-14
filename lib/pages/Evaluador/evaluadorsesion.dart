import 'package:flutter/material.dart';

class EvaluadorLogin extends StatelessWidget {
  const EvaluadorLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .7, size.height * .08),
                    backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    padding: EdgeInsets.all(size.height * .025),
                    textStyle: TextStyle(
                        fontSize: size.aspectRatio * 30,
                        fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/evaluadorHome');
                },
                child: const Text('Iniciar Home Evaluador')),
          ],
        ),
      ),
    );
  }
}
