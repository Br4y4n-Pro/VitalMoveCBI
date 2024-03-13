// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/provider/registro/ProviderRegistro.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';

class RegistroUsertres extends StatefulWidget {
  const RegistroUsertres({super.key});

  @override
  State<RegistroUsertres> createState() => _RegistroUsertres();
}

class _RegistroUsertres extends State<RegistroUsertres> {
  final _formKey = GlobalKey<FormState>();

  var itemsAct = ['Selecciona una opcion', '0', '1', '2', '3', '5', '6', '7'];
  String dropdownValuesAct = 'Selecciona una opcion';
  @override
  Widget build(BuildContext context) {
    final fromProvider =
        Provider.of<RegistroFromProvider>(context, listen: false);
    final provider = Provider.of<RegistroProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 40),
              const Text(
                '¿Cuantos dias por semana realiza actividad fisica ?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Consumer(
                builder: (context, value, child) => Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    value: (fromProvider.actividadsemana.isNotEmpty)
                        ? fromProvider.actividadsemana
                        : dropdownValuesAct,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: itemsAct.map((dynamic item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValuesAct = newValue!;
                        fromProvider.actividadsemana = newValue;
                      });
                    },
                    dropdownColor: Colors.white,
                    underline: Container(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Consumer(
                builder: (context, value, child) => InputLogin(
                  onChanged: (value) => fromProvider.talla = value,
                  campo: 'Talla (M)',
                  tamano: size.width,
                  tipo: const TextInputType.numberWithOptions(decimal: true),
                  initValue:
                      (fromProvider.talla.isNotEmpty) ? fromProvider.talla : '',
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
                    const double alturaMinima = 1.0; // Altura mínima permitida
                    const double alturaMaxima = 2.5; // Altura máxima permitida

                    if (altura < alturaMinima || altura > alturaMaxima) {
                      return 'La altura debe estar entre $alturaMinima y $alturaMaxima metros';
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              Consumer(
                builder: (context, value, child) => InputLogin(
                  onChanged: (value) => fromProvider.peso = value,
                  campo: 'Peso (Kg)',
                  tamano: size.width,
                  tipo: const TextInputType.numberWithOptions(decimal: true),
                  initValue:
                      (fromProvider.peso.isNotEmpty) ? fromProvider.peso : '',
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
              ),
              const SizedBox(height: 20),
              const Text(
                "¿Depende de ayuda para realizar actividad?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, value, child) => InputLogin(
                  onChanged: (value) => fromProvider.dependencia = value,
                  initValue: (fromProvider.dependencia.isNotEmpty)
                      ? fromProvider.dependencia
                      : '',
                  campo: 'Ejemplo : No',
                  tamano: size.width,
                  tipo: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Responder Pregunta';
                    }

                    // Expresión regular para validar texto y espacios
                    final RegExp alergiasRegExp = RegExp(r'^[a-zA-Z\s]+$');

                    if (!alergiasRegExp.hasMatch(value)) {
                      return 'Ingrese un valor válido para alergias (solo texto)';
                    }

                    // Verificación de longitud mínima y máxima
                    if (value.length < 2 || value.length > 100) {
                      return 'La longitud de las alergias debe estar entre 10 y 200 caracteres';
                    }

                    // Aquí puedes agregar otras validaciones según tus requisitos
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .4, size.height * .06),
                        backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        padding: EdgeInsets.all(size.height * .002),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () async {
                      setState(() {
                        try {
                          provider.ischeck = true;
                          provider.registro(fromProvider, context);
                        } catch (e) {
                          print('Error al enviar la solicitud: $e');
                        }
                      });
                    },
                    child: (!provider.ischeck)
                        ? const Text('Registrar')
                        : const CircularProgressIndicator(
                            color: Colors.white,
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
