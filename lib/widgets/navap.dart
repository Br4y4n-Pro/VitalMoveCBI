import 'package:flutter/material.dart';

nav(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height * 0.40,
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(size.width * 0.2),
      ),
    ),
    child: Center(
      child: Image.asset("img/Logo.png"),
    ),
  );
}
