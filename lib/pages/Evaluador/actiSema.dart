// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import '../../widgets/InputRegistro.dart';

class RegistroUsertres extends StatefulWidget {
  const RegistroUsertres({super.key});

  @override
  State<RegistroUsertres> createState() => _RegistroUsertres();
}

class _RegistroUsertres extends State<RegistroUsertres> {
  final _formKey = GlobalKey<FormState>();

  var items = [
    '0 = Sedentario',
    '1 = bajo',
    '3 a 7 = Moderado',
  ];
  String dropdownValues = '0 = Sedentario';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.primaryColor, // Color azul claro
        centerTitle: true, // Centra el título del AppBar
        title: const Text('Registro de Actividad '),
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
                  const SizedBox(height: 40),
                  const Text(
                    '¿Cuantos dias por semana realiza activida fisica ?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.8,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300, blurRadius: 3)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          value: dropdownValues,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValues = newValue!;
                            });
                          },
                          dropdownColor: Colors.white,
                          underline: Container(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  inputLoginRe(
                    campo: 'Talla (M)',
                    tamano: size.width,
                    tipo: const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su talla';
                      }

                      // Expresión regular para validar que el valor contenga solo números y opcionalmente un punto decimal
                      final RegExp tallaRegExp = RegExp(r'^\d+(\.\d+)?$');

                      if (!tallaRegExp.hasMatch(value)) {
                        return 'La talla debe ser un número válido';
                      }

                      // Validación de altura mínima y máxima
                      final double altura = double.parse(value);
                      const double alturaMinima =
                          1.0; // Altura mínima permitida
                      const double alturaMaxima =
                          2.5; // Altura máxima permitida

                      if (altura < alturaMinima || altura > alturaMaxima) {
                        return 'La altura debe estar entre $alturaMinima y $alturaMaxima metros';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  inputLoginRe(
                    campo: 'Peso (Kg)',
                    tamano: size.width,
                    tipo: const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su peso';
                      }

                      // Expresión regular para validar que el valor contenga solo números y opcionalmente un punto decimal
                      final RegExp pesoRegExp = RegExp(r'^\d*\.?\d*$');

                      if (!pesoRegExp.hasMatch(value)) {
                        return 'El peso debe ser un número válido';
                      }

                      // Validar rango mínimo y máximo
                      final double peso = double.parse(value);
                      if (peso < 40 || peso > 200) {
                        return 'El peso debe estar entre 40 y 200 Kg';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width * .4, size.height * .06),
                            backgroundColor:
                                const Color.fromRGBO(0, 150, 199, 1),
                            foregroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                            padding: EdgeInsets.all(size.height * .002),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          _mostrarDialogo(context);
                        },
                        child: const Text('Registrar')),
                  ),
                ],
              ),
              Positioned(
                bottom: 15,
                right: 10,
                child: Row(
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
                                    Navigator.pushNamed(
                                        context, '/registerUser');
                                  },
                                  icon: const Icon(
                                    Icons.circle_outlined,
                                    size: 10,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/registerUser2');
                                  },
                                  icon: const Icon(
                                    Icons.circle_outlined,
                                    size: 10,
                                  )),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/registerUser3');
                                },
                                icon: const Icon(
                                  Icons.circle_rounded,
                                  size: 10,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/registerUser2');
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                size: 40,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _mostrarDialogo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Usuario Registrado Exitosamente '),
        content: const Text(''),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Evaluador'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/');
            },
            child: const Text(''),
          ),
        ],
      );
    },
  );
}
