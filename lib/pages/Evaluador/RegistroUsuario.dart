// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:image_picker/image_picker.dart';
import 'package:vitalmovecbi/index.dart';
import '../../widgets/InputText.dart';
=======
import '../../widgets/InputRegistro.dart';
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
import 'package:date_field/date_field.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  String? imagenPath;
  final ImagePicker picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  String dropdownValue = 'A+';

  // List of items in our dropdown menu inputLoginRe
  var items = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  String dropdownValues = 'Masculino'; // Valor inicial
  var generoItems = ['Masculino', 'Femenino']; // Lista de géneros
// Cargar y mostrar imagen en el formulario
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      (imagenPath == null)
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("img/Usuario/usu2.png"),
                              ),
                            )
                          : Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      FileImage(File(imagenPath!))),
                            ),
                      Positioned(
                          bottom: 1,
                          right: size.width * .35,
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        const Text(
                                          "Selecciona una foto de perfil",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(height: 10),
                                        Image.asset(
                                          "img/General/galecam.png",
                                          height: 60,
                                        )
                                      ],
                                    ),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          final XFile? image =
                                              await picker.pickImage(
                                                  source: ImageSource.camera);
                                          imagenPath = image?.path;
                                          imagenPath ??= null;
                                          setState(() {});
                                        },
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.camera,
                                              size: 50,
                                              color: Colores.primaryColor,
                                            ),
                                            textContent("Camara"),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context)
                                              .pop(); // Cerrar el diálogo
                                          final XFile? image =
                                              await picker.pickImage(
                                                  source: ImageSource.gallery);
                                          imagenPath = image?.path;
                                          imagenPath ??= null;
                                          setState(() {});
                                        },
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.photo,
                                              size: 50,
                                              color: Colores.primaryColor,
                                            ),
                                            textContent("Galeria"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colores.primaryColor,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 15),
<<<<<<< HEAD
                  inputLogin('Nombre', size.width, TextInputType.name),
                  const SizedBox(height: 15),
                  inputLogin('Apellido', size.width, TextInputType.name),
                  const SizedBox(height: 15),
                  inputLogin('Documento de Identidad', size.width,
                      TextInputType.number),
=======
                  inputLoginRe(
                    campo: 'Nombre',
                    tamano: size.width,
                    tipo: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      if (value.length < 2 || value.length > 10) {
                        return 'El nombre debe tener entre 2 y 10 caracteres';
                      }
                      final RegExp regex = RegExp(
                        r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$',
                      );
                      if (!regex.hasMatch(value)) {
                        return 'El nombre no es válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  inputLoginRe(
                    campo: 'Apellido',
                    tamano: size.width,
                    tipo: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su apellido';
                      }
                      if (value.length < 2 || value.length > 10) {
                        return 'El apellido debe tener entre 2 y 10 caracteres';
                      }
                      final RegExp regex = RegExp(
                        r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$',
                      );
                      if (!regex.hasMatch(value)) {
                        return 'El apellido no es válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  inputLoginRe(
                    campo: 'Documento de Identidad',
                    tamano: size.width,
                    tipo: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su documento de identidad';
                      }
                      if (value.length < 7 || value.length > 12) {
                        return 'El documento de identidad debe tener entre 7 y 12 caracteres';
                      }
                      final RegExp regex = RegExp(
                        r'^\d{7,12}$',
                      );
                      if (!regex.hasMatch(value)) {
                        return 'El documento de identidad no es válido';
                      }
                      return null;
                    },
                  ),
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DateTimeFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        hintText: "Fecha de Nacimiento ",
<<<<<<< HEAD

=======
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
<<<<<<< HEAD
                      firstDate: DateTime.now().add(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 40)),
                      initialPickerDateTime:
                          DateTime.now().add(const Duration(days: 20)),
                      onChanged: (DateTime? value) {
                        selectedDate = value;
                      },
=======
                      firstDate: DateTime.now().subtract(const Duration(
                          days: 43800)), // 120 años en días (365 * 120)
                      lastDate: DateTime.now().subtract(const Duration(
                          days: 6570)), // 18 años en días (365 * 18)
                      initialPickerDateTime: DateTime.now().subtract(
                          const Duration(
                              days: 6570)), // Inicialmente, 18 años atrás
                      onChanged: (DateTime? value) {
                        selectedDate = value;
                      },
                      validator: (date) {
                        if (date == null) {
                          return 'Por favor ingrese una fecha de nacimiento válida';
                        }
                        final age =
                            DateTime.now().difference(date).inDays ~/ 365;
                        if (age < 18) {
                          return 'Debe tener al menos 18 años de edad';
                        } else if (age > 120) {
                          return 'La edad máxima permitida es de 120 años';
                        }
                        return null;
                      },
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * .5,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
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
                          value: dropdownValues,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: generoItems.map((String item) {
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
                      const SizedBox(height: 15),
                      Container(
                        width: size.width * .21,
                        padding: const EdgeInsets.symmetric(horizontal: 11),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          dropdownColor: Colors.white,
                          underline: Container(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
<<<<<<< HEAD
                  inputLogin('Dirección', size.width, TextInputType.text),
                  const SizedBox(height: 15),
                  inputLogin('EPS', size.width, TextInputType.text),
                  const SizedBox(height: 15),
                  inputLogin('Alergias', size.width, TextInputType.text),
                  const SizedBox(height: 15),
                  inputLogin('Grupo', size.width, TextInputType.number),
                  const SizedBox(height: 11),
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
                                      Navigator.pushNamed(
                                          context, '/registerUser');
                                    },
                                    icon: const Icon(
                                      Icons.circle_rounded,
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
                                    Icons.circle_outlined,
                                    size: 10,
                                  ),
                                )
                              ],
                            ),
                            IconButton(
=======
                  inputLoginRe(
                    campo: 'Dirección',
                    tamano: size.width,
                    tipo: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su dirección';
                      }
                      if (value.length < 2 || value.length > 50) {
                        return 'La dirección debe tener entre 2 y 50 caracteres';
                      }
                      final RegExp regex = RegExp(
                        r'^[a-zA-Z0-9\s.,#-]+$',
                      );
                      if (!regex.hasMatch(value)) {
                        return 'La dirección no es válida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  // Validación para el campo EPS
                  // Validación para el campo EPS con expresión regular
                  // Validación para el campo EPS como texto
                  inputLoginRe(
                    campo: 'EPS',
                    tamano: size.width,
                    tipo: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su EPS';
                      }

                      // Expresión regular para validar texto y espacios entre 3 y 50 caracteres
                      final RegExp epsRegExp = RegExp(r'^[a-zA-Z\s]{3,50}$');

                      if (!epsRegExp.hasMatch(value)) {
                        return 'Ingrese un valor válido para EPS (solo texto, entre 3 y 50 caracteres)';
                      }

                      // Aquí puedes agregar otras validaciones según tus requisitos
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),
// Validación para el campo "Alergias" como texto
                  inputLoginRe(
                    campo: 'Alergias',
                    tamano: size.width,
                    tipo: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese sus alergias';
                      }

                      // Expresión regular para validar texto y espacios
                      final RegExp alergiasRegExp = RegExp(r'^[a-zA-Z\s]+$');

                      if (!alergiasRegExp.hasMatch(value)) {
                        return 'Ingrese un valor válido para alergias (solo texto)';
                      }

                      // Verificación de longitud mínima y máxima
                      if (value.length < 5 || value.length > 200) {
                        return 'La longitud de las alergias debe estar entre 10 y 200 caracteres';
                      }

                      // Aquí puedes agregar otras validaciones según tus requisitos
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  // Validación para el campo "Grupo" como texto con longitud exacta de 8 caracteres
                  // Validación para el campo "Grupo" como texto con longitud exacta de 5 caracteres y que sean números del 1 al 10
                  // Validación para el campo "Grupo" que acepta solo los valores "Grupo 1" o "Grupo 2"
                  inputLoginRe(
                    campo: 'Grupo',
                    tamano: size.width,
                    tipo: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su grupo';
                      }

                      // Expresión regular para validar que el valor sea exactamente "Grupo 1" o "Grupo 2"
                      final RegExp grupoRegExp = RegExp(r'^(Grupo 1|Grupo 2)$');

                      if (!grupoRegExp.hasMatch(value)) {
                        return 'El grupo debe ser "Grupo 1" o "Grupo 2"';
                      }

                      // Aquí puedes agregar otras validaciones según tus requisitos
                      return null;
                    },
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
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
                                  Navigator.pushNamed(context, '/registerUser');
                                },
                                icon: const Icon(
                                  Icons.circle_rounded,
                                  size: 10,
                                ),
                              ),
                              IconButton(
>>>>>>> 5d84e3a73635b23461fa8675ba2373a46d381e7e
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/registerUser2');
                                },
                                icon: const Icon(
                                  Icons.circle_outlined,
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
                              Navigator.pushNamed(context, '/registerUser2');
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
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
