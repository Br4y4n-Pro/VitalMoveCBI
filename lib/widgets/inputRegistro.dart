// ignore_for_file: file_names

import 'package:flutter/material.dart';

class InputLoginRe extends StatelessWidget {
  final String campo;
  final double tamano;
  final TextInputType tipo;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const InputLoginRe({
    super.key,
    required this.campo,
    required this.tamano,
    required this.tipo,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
