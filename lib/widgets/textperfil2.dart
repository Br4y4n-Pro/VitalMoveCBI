import 'package:flutter/material.dart';

Widget textSub2(String data) {
  return Text(data,
      style: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
      ));
}

Widget textContent2(String data) {
  return Text(
    data,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  );
}
