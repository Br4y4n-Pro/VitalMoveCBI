// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';

class RegistroUserdos extends StatefulWidget {
  const RegistroUserdos({super.key});

  @override
  State<RegistroUserdos> createState() => _RegistroUserdosState();
}

class _RegistroUserdosState extends State<RegistroUserdos> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fromProvider =
        Provider.of<RegistroFromProvider>(context, listen: false);

    return Scaffold(
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
                      Consumer(
                        builder: (context, value, child) => InputLogin(
                          onChanged: (value) =>
                              fromProvider.nombreEmergencia = value,
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
                      ),
                      const SizedBox(height: 15),
                      Consumer(
                        builder: (context, value, child) => InputLogin(
                          onChanged: (value) =>
                              fromProvider.telefonoEmergencia = value,
                          campo: 'Numero de Telefono',
                          tamano: size.width,
                          tipo: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su Numero de telefono';
                            }

                            final RegExp telefonoRegExp =
                                RegExp(r'^[0-9]{10}$');

                            if (!telefonoRegExp.hasMatch(value)) {
                              return 'El número de teléfono debe contener exactamente 10 números';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Consumer(
                        builder: (context, value, child) => InputLogin(
                          onChanged: (value) => fromProvider.parentesco = value,
                          campo: 'Parentesco',
                          tamano: size.width,
                          tipo: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su parentesco';
                            }

                            final RegExp parentezcoRegExp =
                                RegExp(r'^[a-zA-Z ]{5,20}$');

                            if (!parentezcoRegExp.hasMatch(value)) {
                              return 'El parentezco debe contener solo letras y tener entre 5 y 20 caracteres';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
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
