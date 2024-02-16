import 'package:flutter/material.dart';

class Pruebita extends StatelessWidget {
  const Pruebita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebita'),
      ),
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: Colors.blue,
          height: 400,
          child: const Center(
            child: Text('pruebita'),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.6); // Línea a la parte inferior izquierda

    path.quadraticBezierTo(

        
        
    size.width / 1.9, size.height * 1, size.width * 1, size.height * 0.6); // Curva hacia abajo en el centro
    path.lineTo(size.width,0.6 );
     // Línea a la parte superior derecha
    path.close(); // Cerrar el camino
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
