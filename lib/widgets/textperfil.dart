import 'package:flutter/material.dart';

Widget textSub(String data) {
  return Text(data,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ));
}

Widget textContent(String data) {
  return Text(
    data,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  );
}
