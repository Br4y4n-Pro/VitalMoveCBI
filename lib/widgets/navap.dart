import 'package:flutter/material.dart';

nav(context) {
  final size = MediaQuery.of(context).size;
// <<<<<<< HEAD
//   return Container(
//     width: size.width,
//     height: size.height * 0.40,
//     decoration: BoxDecoration(
//       color: const Color(0xFFADE8F4),
//       borderRadius: BorderRadius.vertical(
//         bottom: Radius.circular(size.width * 0.2),
// =======
  return Column(
    children: [
      Container(
        width: size.width * 1,
        height: size.height * .38,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/General/fondo.png"), fit: BoxFit.fill),
        ),
      ),
      Container(
        height: 90,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/Logo.png"), fit: BoxFit.contain)),
      ),
    ],
  );
}
