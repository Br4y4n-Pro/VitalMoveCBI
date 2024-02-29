// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:date_field/date_field.dart';
import 'package:vitalmovecbi/provider/registro/ProviderRegistro.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  //Controladores de los textfield de donde se envia la info

  File? imagenPath;

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
//  final fromProvider = Provider.of<RegistroProvider>(context, listen: false);
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
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("img/Usuario/usu2.png"),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colores.primaryColor),
                            child: IconButton(
                                onPressed: () {
                                  print("Doy click");
                                  _alertDialogo(context);
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DateTimeFormField(
                    mode: DateTimeFieldPickerMode
                        .date, // Modo para seleccionar solo la fecha
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Fecha de Nacimiento ",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
<<<<<<< HEAD
                    const SizedBox(height: 15),

                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 3)
                          ]),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
                      final age = DateTime.now().difference(date).inDays ~/ 365;
                      if (age < 18) {
                        return 'Debe tener al menos 18 años de edad';
                      } else if (age > 120) {
                        return 'La edad máxima permitida es de 120 años';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
>>>>>>> 08c799174dffb4ee8309e029b162defcc3e4bb59
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
                    const SizedBox(height: 12),
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
<<<<<<< HEAD
                        const SizedBox(height: 12),
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
                                genero = newValue;
                              });
                            },
                            dropdownColor: Colors.white,
                            underline: Container(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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

                    const SizedBox(height: 10),
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

                    const SizedBox(height: 10),

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
                        final RegExp grupoRegExp =
                            RegExp(r'^(Grupo 1|Grupo 2)$');

                        if (!grupoRegExp.hasMatch(value)) {
                          return 'El grupo debe ser "Grupo 1" o "Grupo 2"';
                        }

                        // Aquí puedes agregar otras validaciones según tus requisitos
                        return null;
                      },
=======
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
>>>>>>> 08c799174dffb4ee8309e029b162defcc3e4bb59
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
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

                const SizedBox(height: 10),
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

                const SizedBox(height: 10),

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
          ),
        ),
      ),
    );
  }

  AlertDialog _alertDialogo(BuildContext context) {
      final registroProvider = Provider.of<RegistroProvider>(context, listen: false);

  return AlertDialog(
    title: const Text('Selecciona una opción'),
    content: Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/General/galecam.png"),
          fit: BoxFit.cover, // Añade un fit para ajustar la imagen dentro del contenedor
        ),
      ),
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              registroProvider.seleccionarImagen(context, ImageSource.camera);
            },
            child: const Column(
              children: [
                Icon(Icons.camera_alt),
                Text('Cámara'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              registroProvider.seleccionarImagen(context, ImageSource.gallery);
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
}
}
