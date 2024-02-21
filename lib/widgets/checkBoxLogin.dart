// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';

class CheckBoxInput extends StatefulWidget {
  const CheckBoxInput({super.key});

  @override
  State<CheckBoxInput> createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colores.primaryColor,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
