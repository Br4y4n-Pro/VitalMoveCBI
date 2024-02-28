// ignore_for_file: file_names

import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final String campo;
  final double tamano;
  final TextInputType tipo;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const InputLogin({
    this.validator,
    required this.campo,
    required this.tamano,
    required this.tipo,
    this.onChanged,
    super.key,
  });

  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.tamano,
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          keyboardType: widget.tipo,
          cursorColor: const Color.fromARGB(33, 15, 15, 15),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: widget.campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
        ));
  }
}
