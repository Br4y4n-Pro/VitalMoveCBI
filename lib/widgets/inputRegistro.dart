

// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget inputLoginRe({
  required controller,
  required String campo,
  required double tamano,
  required TextInputType tipo,
  FormFieldValidator<String>? validator,
}) {
  return Column(
    children: [
      Container(
        width: tamano,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          keyboardType: tipo,
          cursorColor: const Color.fromARGB(33, 15, 15, 15),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontStyle: FontStyle.normal,
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: campo,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
          controller: controller,// Aquí se proporciona la función de validación
        ),
      ),
    ],
  );
}

