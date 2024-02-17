import 'package:flutter/material.dart';

nav(context) {
  final size = MediaQuery.of(context).size;
  return Column(
    children: [
      Container(
        width: size.width * 1,
        height: size.height * .38,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/General/fondo.png"), fit: BoxFit.fill)),
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
