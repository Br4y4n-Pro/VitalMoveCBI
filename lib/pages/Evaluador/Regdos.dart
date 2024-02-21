// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../widgets/InputRegistro.dart';

class RegistroUserdos extends StatefulWidget {
  const RegistroUserdos({super.key});

  @override
  State<RegistroUserdos> createState() => _RegistroUserdos();
}

class _RegistroUserdos extends State<RegistroUserdos> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, // Color azul claro
        centerTitle: true, // Centra el título del AppBar
        title: const Text('Registro de Usuario'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Datos persona de emergencia',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
<<<<<<< HEAD
                      inputLogin(
                          'Nombre Completo ', size.width, TextInputType.name),
                      const SizedBox(height: 15),
                      inputLogin('Teléfono', size.width, TextInputType.phone),
                      const SizedBox(height: 15),
                      inputLogin('Parentezco', size.width, TextInputType.text),
=======
                      inputLoginRe(
                        campo: 'Nombre completo',
                        tamano: size.width,
                        tipo: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su nombre completo';
                          }

                          final RegExp nombreCompletoRegExp =
                              RegExp(r'^[a-zA-Z\s]{5,40}$');

                          if (!nombreCompletoRegExp.hasMatch(value)) {
                            return 'El nombre completo debe contener solo letras y tener entre 10 y 40 caracteres';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      inputLoginRe(
                        campo: 'Numero de Telefono',
                        tamano: size.width,
                        tipo: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su Numero de telefono';
                          }

                          // Expresión regular para validar que el valor contenga solo números y tenga exactamente 10 caracteres
                          final RegExp telefonoRegExp = RegExp(r'^[0-9]{10}$');

                          if (!telefonoRegExp.hasMatch(value)) {
                            return 'El número de teléfono debe contener exactamente 10 números';
                          }

                          // Aquí puedes agregar otras validaciones según tus requisitos
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      inputLoginRe(
                        campo: 'Parentezco',
                        tamano: size.width,
                        tipo: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su parentezco';
                          }

                          // Expresión regular para validar que el valor contenga solo texto y tenga longitud entre 5 y 20 caracteres
                          final RegExp parentezcoRegExp =
                              RegExp(r'^[a-zA-Z ]{5,20}$');

                          if (!parentezcoRegExp.hasMatch(value)) {
                            return 'El parentezco debe contener solo letras y tener entre 5 y 20 caracteres';
                          }

                          // Aquí puedes agregar otras validaciones según tus requisitos
                          return null;
                        },
                      ),
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
                      const SizedBox(height: 15),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * .8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 40, width: 56),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
<<<<<<< HEAD
                                    Navigator.pop(context, '/registerUser');
=======
                                    Navigator.pushNamed(
                                        context, '/registerUser');
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
                                  },
                                  icon: const Icon(
                                    Icons.circle_outlined,
                                    size: 10,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/registerUser2');
                                  },
                                  icon: const Icon(
                                    Icons.circle_rounded,
                                    size: 10,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/registerUser3');
                                  },
                                  icon: const Icon(
                                    Icons.circle_outlined,
                                    size: 10,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/registerUser3');
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
