// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


Widget inputLogin2(String campo) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
          cursorColor: const Color.fromARGB(33, 15, 15, 15),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none))));
}
