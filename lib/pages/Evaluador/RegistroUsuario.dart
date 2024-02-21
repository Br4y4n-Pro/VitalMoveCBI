// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitalmovecbi/index.dart';
import '../../widgets/InputText.dart';
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

  // List of items in our dropdown menu
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
                  inputLogin('Nombre', size.width, TextInputType.name),
                  const SizedBox(height: 15),
                  inputLogin('Apellido', size.width, TextInputType.name),
                  const SizedBox(height: 15),
                  inputLogin('Documento de Identidad', size.width,
                      TextInputType.number),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: DateTimeFormField(
                      decoration: InputDecoration(
                        // fillColor: Color.fromARGB(255, 201, 142, 142),

                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        hintText: "Fecha de Nacimiento ",

                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                      firstDate: DateTime.now().add(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 40)),
                      initialPickerDateTime:
                          DateTime.now().add(const Duration(days: 20)),
                      onChanged: (DateTime? value) {
                        selectedDate = value;
                      },
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
                                color: Colors.grey.shade300, blurRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
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

                          dropdownColor: Colors
                              .white, // Color de fondo del menú desplegable
                          underline:
                              Container(), // Esto elimina la línea que atraviesa de lado a lado
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
                                  color: Colors.grey.shade300, blurRadius: 3)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
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
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/registerUser2');
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
