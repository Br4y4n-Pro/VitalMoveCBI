// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:date_field/date_field.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({
    super.key,
  });

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  //Controladores de los textfield de donde se envia la info

  final _formKey = GlobalKey<FormState>();
  Uint8List webImage = Uint8List(8);
  DateTime? selectedDate;
  String dropdownValue = 'A+';
  String dropdownValuesrh = 'Selecciona una opcion'; // Valor inicial
  String? filename = '';
  File? _imgperfil;
  var itemsrh = [
    'Selecciona una opcion',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  String dropdownValues = 'Selecciona una opcion'; // Valor inicial
  var generoItems = [
    'Selecciona una opcion',
    'Masculino',
    'Femenino'
  ]; // Lista de géneros
// Cargar y mostrar imagen en el formulario

  @override
  Widget build(BuildContext context) {
    final fromProvider =
        Provider.of<RegistroFromProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    "Datos Personales",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Center(
                      child: Stack(
                        alignment: const Alignment(1, 1),
                        children: [
                          Consumer(
                            builder: (context, fromProvider, child) =>
                                Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: _imgperfil != null
                                    ? Image.file(
                                        _imgperfil!,
                                        fit: BoxFit.cover,
                                      )
                                    : const Image(
                                        image:
                                            AssetImage("img/Usuario/usu2.png"),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colores.primaryColor),
                            child: kIsWeb
                                ? Container()
                                : IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              elevation: 500,
                                              title: const Text(
                                                  'Selecciona una opción'),
                                              content: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "img/General/galecam.png"),
                                                    fit: BoxFit
                                                        .contain, // Añade un fit para ajustar la imagen dentro del contenedor
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        _pickImageCamera(
                                                            fromProvider);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Column(
                                                        children: [
                                                          Icon(
                                                              Icons.camera_alt),
                                                          Text('Cámara'),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        _pickImageGallery(
                                                            fromProvider);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Column(
                                                        children: [
                                                          Icon(Icons.photo),
                                                          Text('Galería'),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colores.quaternaryColor,
                                    )),
                          )
                        ],
                      ),
                    )),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                      ]),
                ),

                const SizedBox(height: 10),
                Consumer(
                  builder: (context, value, child) => InputLogin(
                    onChanged: (value) => fromProvider.nombres = value,
                    campo: 'Nombres',
                    tamano: size.width,
                    tipo: TextInputType.name,
                    initValue: (fromProvider.nombres.isNotEmpty)
                        ? fromProvider.nombres
                        : '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      if (value.length < 2 || value.length > 50) {
                        return 'El nombre debe tener entre 2 y 50 caracteres';
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
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, value, child) => InputLogin(
                    onChanged: (value) => fromProvider.apellidos = value,
                    initValue: (fromProvider.apellidos.isNotEmpty)
                        ? fromProvider.apellidos
                        : '',
                    campo: 'Apellidos',
                    tamano: size.width,
                    tipo: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su apellido';
                      }
                      if (value.length < 2 || value.length > 50) {
                        return 'El apellido debe tener entre 2 y 50 caracteres';
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
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, value, child) => InputLogin(
                    onChanged: (value) {
                      fromProvider.dni = value;
                      fromProvider.contrasena = value;
                    },
                    campo: 'Documento de Identidad',
                    tamano: size.width,
                    tipo: TextInputType.number,
                    initValue:
                        (fromProvider.dni.isNotEmpty) ? fromProvider.dni : '',
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
                ),
                const SizedBox(height: 10),

                Consumer(
                  builder: (context, value, child) => Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DateTimeFormField(
                          initialValue: (fromProvider.fechaNacimiento == null)
                              ? fromProvider.fechaNacimiento
                              : null,
                          mode: DateTimeFieldPickerMode
                              .date, // Solo permite seleccionar la fecha
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            hintText: "Fecha de Nacimiento",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (DateTime? value) {
                            setState(() {
                              selectedDate = value;
                              fromProvider.fechaNacimiento = value;
                            });
                          })),
                ),
                const SizedBox(height: 15),

                Consumer(
                  builder: (context, value, child) => Container(
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
                      value: (fromProvider.genero.isNotEmpty)
                          ? fromProvider.genero
                          : dropdownValues,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: generoItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {
                        fromProvider.genero = value!;
                        dropdownValues = value;
                      }),
                      dropdownColor: Colors.white,
                      underline: Container(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Consumer(
                  builder: (context, value, child) => Container(
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
                      value: (fromProvider.rh.isNotEmpty)
                          ? fromProvider.rh
                          : dropdownValuesrh,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsrh.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValuesrh = newValue!;
                          fromProvider.rh = newValue;
                        });
                      },
                      dropdownColor: Colors.white,
                      underline: Container(),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Consumer(
                  builder: (context, value, child) => InputLogin(
                    onChanged: (value) => fromProvider.direccion = value,
                    campo: 'Dirección',
                    tamano: size.width,
                    tipo: TextInputType.text,
                    initValue: (fromProvider.direccion.isNotEmpty)
                        ? fromProvider.direccion
                        : '',
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
                ),

                const SizedBox(height: 10),

                Consumer(
                  builder: (context, value, child) => InputLogin(
                    onChanged: (value) => fromProvider.eps = value,
                    campo: 'EPS',
                    tamano: size.width,
                    tipo: TextInputType.text,
                    initValue:
                        (fromProvider.eps.isNotEmpty) ? fromProvider.eps : '',
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
                ),

                const SizedBox(height: 10),
                // Validación para el campo "Alergias" como texto
                Consumer(
                  builder: (context, value, child) => InputLogin(
                    onChanged: (value) => fromProvider.alergias = value,
                    initValue: (fromProvider.alergias.isNotEmpty)
                        ? fromProvider.alergias
                        : '',
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
                ),

                const SizedBox(height: 10),

                Consumer(
                  builder: (context, value, child) => InputLogin(
                    onChanged: (value) => fromProvider.grupo = value,
                    campo: 'Grupo',
                    tamano: size.width,
                    tipo: TextInputType.text,
                    initValue: (fromProvider.grupo.isNotEmpty)
                        ? fromProvider.grupo
                        : '',
                    validator: (value) {
                      final RegExp regex = RegExp(
                        r'^[a-zA-Z0-9\s.,#-]+$',
                      );
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el Grupo';
                      }
                      if (value.length < 2 || value.length > 50) {
                        return 'El nombre del grupo debe tener entre 2 y 50 caracteres';
                      }
                      if (!regex.hasMatch(value)) {
                        return 'El nombre del no es válido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _pickImageGallery(RegistroFromProvider fromProvider) async {
    if (!kIsWeb) {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;

      setState(() {
        _imgperfil = File(returnedImage.path);
        fromProvider.imgperfil = _imgperfil;
      });
    } else if (kIsWeb) {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      _imgperfil = File(returnedImage.path);
      var f = await returnedImage.readAsBytes();
      setState(() {
        webImage = f;
        fromProvider.imgperfil = null;
      });
    }
  }

  Future _pickImageCamera(RegistroFromProvider fromProvider) async {
    if (!kIsWeb) {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnedImage == null) return;

      setState(() {
        _imgperfil = File(returnedImage.path);
        fromProvider.imgperfil = _imgperfil;
      });
    } else if (kIsWeb) {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnedImage == null) return;
      _imgperfil = File(returnedImage.path);
      var f = await returnedImage.readAsBytes();
      setState(() {
        webImage = f;
        fromProvider.imgperfil = null;
      });
    }
  }
}
//     // Añade la lógica para agregar el archivo de imagen si está presente
//     if (_imgperfil != null) {
//       data["imgperfil"] = await MultipartFile.fromFile(_imgperfil!.path,
//           filename: filename ?? "image.jpg");
//     }


