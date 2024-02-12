
import 'package:flutter/material.dart';

Widget inputLogin(String campo,double tamano) {
  return Container(
    width: tamano,
      decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
          cursorColor: Color.fromARGB(33, 15, 15, 15),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)
                  )
                  )
                  );
}
