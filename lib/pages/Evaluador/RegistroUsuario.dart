
// import 'package:flutter/material.dart';

// class RegistroUsuario extends StatefulWidget {
//   const RegistroUsuario({Key? key}) : super(key: key);

//   @override
//   State<RegistroUsuario> createState() => _RegistroUsuarioState();
// }

// class _RegistroUsuarioState extends State<RegistroUsuario> {
//   final _formKey = GlobalKey<FormState>();

//   String _nombre = "";
//   String _apellido = "";
//   String _documentoIdentidad = "";
//   DateTime? _fechaNacimiento; // Nullable DateTime
//   String? _genero; // Nullable String
//   String _tipoSangre = "";
//   String _direccion = "";
//   String _eps = "";
//   String _alergias = "";
//   String _grupo = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registro de Usuario'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
                
                
//                 inputLogin(
//                  'Nombre',
//                  (value) {
//                  setState(() {
//                  _nombre = value;
//                               });
//                               },
//                  (value) {
//                 if (value == null || value.isEmpty) {
//                 return 'Por favor, ingresa tu nombre';
//             }
//          return null;
//         },
//                 ),
                
                
                
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Apellido'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, ingresa tu apellido';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _apellido = value;
//                     });
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'DocumentoIdentidad'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, Tu Documento de identidad ';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _documentoIdentidad = value;
//                     });
//                   },
//                 ),
//                 // TextFormField(
//                 //   decoration: InputDecoration(labelText: 'FechaNacimiento'),
//                 //   validator: (value) {
//                 //     if (value == null || value.isEmpty) {
//                 //       return 'Por favor, ingresa tu nombre';
//                 //     }
//                 //     return null;
//                 //   },
//                 //   onChanged: (value) {
//                 //     setState(() {
//                 //       _fechaNacimiento = value;
//                 //     });
//                 //   },
//                 // ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Genero'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, ingresa tu Genero';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _genero = value;
//                     });
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Tipo Sangre'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, ingresa tu Tipo de sangre ';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _tipoSangre = value;
//                     });
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Direccion'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, ingresa tu Direccion ';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _direccion = value;
//                     });
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Eps'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, ingresa tu EPS';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _eps = value;
//                     });
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Alerguias'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, ingresa tus Alerguias';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _alergias = value;
//                     });
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Grupo'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, ingresa tu Grupo ';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _grupo = value;
//                     });
//                   },
//                 ),
//                 // Resto de los TextFormField para los demás campos...
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Procesar los datos del formulario
//                       // por ejemplo, guardarlos en una base de datos
//                       // o enviarlos a través de una API
//                     }
//                   },
//                   child: Text('Enviar'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// Widget inputLogin(String campo, void Function(String) onChanged, String? Function(String?)? validator) {
//   return Container(
//     decoration: BoxDecoration(
//       color: const Color.fromARGB(34, 174, 174, 174),
//       borderRadius: BorderRadius.circular(50)
//     ),
//     child: TextField(
//       onChanged: onChanged,
//       cursorColor: Colors.orangeAccent,
//       decoration: InputDecoration(
//         hintText: campo,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: BorderSide.none
//         )
//       ),
//       validator: validator,
//     ),
//   );
// }
import 'package:flutter/material.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({Key? key}) : super(key: key);

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  final _formKey = GlobalKey<FormState>();

  String _nombre = "";
  String _apellido = "";
  String _documentoIdentidad = "";
  DateTime? _fechaNacimiento; // Nullable DateTime
  String? _genero; // Nullable String
  String _tipoSangre = "";
  String _direccion = "";
  String _eps = "";
  String _alergias = "";
  String _grupo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//     appBar: AppBar(
//   title: Text('Registro de Usuario'),
//   backgroundColor: Colors.lightBlueAccent, // Color azul claro
//   centerTitle: true, // Centra el título del AppBar
// ),

appBar: AppBar(
  backgroundColor: Colors.lightBlueAccent, // Color azul claro
  centerTitle: true, // Centra el título del AppBar
  title: Text('Registro de Usuario'),
  leading: CircleAvatar(
    backgroundImage: AssetImage('img/Perfil.png'), // Reemplaza 'ruta_de_la_imagen' con la ruta de tu imagen
  ),
),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction, // Activa la validación al interactuar con el usuario
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                inputLogin(
                  'Nombre',
                  (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                inputLogin(
                 'Apellido',
                  (value) {
                    setState(() {
                      _apellido = value;
                    });
                  },
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                inputLogin(
                  'Documento de Identidad',
                   (value) {
                    setState(() {
                      _documentoIdentidad = value;
                    });
                  },
                   (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu Documento de identidad ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                inputLogin(
                   'Género',
                  (value) {
                    setState(() {
                      _genero = value;
                    });
                  },
                   (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                inputLogin(
                 'Tipo de Sangre',
                   (value) {
                    setState(() {
                      _tipoSangre = value;
                    });
                  },
                   (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
               inputLogin(
                  'Dirección',
                  (value) {
                    setState(() {
                      _direccion = value;
                    });
                  },
                   (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                inputLogin(
                  'EPS',
                   (value) {
                    setState(() {
                      _eps = value;
                    });
                  },
                   (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                inputLogin(
                  'Alergias',
                   (value) {
                    setState(() {
                      _alergias = value;
                    });
                  },
                   (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                inputLogin(
                  'Grupo',
                  (value) {
                    setState(() {
                      _grupo = value;
                    });
                  },
                   (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu grupo ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Procesar los datos del formulario si es válido
                    }
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputLogin(String campo, void Function(String) onChanged, String? Function(String?)? validator) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromRGBO(14, 60, 209, 0.129),
      borderRadius: BorderRadius.circular(50)
    ),
    child: TextFormField(
      onChanged: onChanged,
      cursorColor: const Color.fromARGB(255, 226, 128, 0),
      decoration: InputDecoration(
        hintText: campo,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none
        )
      ),
      validator: validator,
    ),
  );
}
