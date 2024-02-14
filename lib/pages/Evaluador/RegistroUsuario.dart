
import 'package:flutter/material.dart';
import '../../widgets/InputText.dart';
import 'package:date_field/date_field.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({Key? key}) : super(key: key);

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
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
                  
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: const CircleAvatar(
                      radius: 30,
<<<<<<< HEAD
                      backgroundImage: AssetImage("img/usuario2.png"),
=======
                      backgroundImage: AssetImage("img/Usuario/usu2.png"),
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
                    ),
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Nombre',
                    size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Apellido',
                    size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Documento de Identidad',
                    size.width,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
<<<<<<< HEAD
                        color: const Color(0xffF5F5F5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: DateTimeFormField(
                      decoration: InputDecoration(
                        // fillColor: Color.fromARGB(255, 201, 142, 142),
=======
                      color: const Color(0xffF5F5F5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DateTimeFormField(
                      decoration: InputDecoration(
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
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
<<<<<<< HEAD
                        width: size.width * .5,
=======
                        width: size.width * 0.5,
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          boxShadow: [
<<<<<<< HEAD
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 3)
=======
                            BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
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
<<<<<<< HEAD
                          dropdownColor: Colors
                              .white, // Color de fondo del menú desplegable
                          underline:
                              Container(), // Esto elimina la línea que atraviesa de lado a lado
=======
                          dropdownColor: Colors.white,
                          underline: Container(),
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
<<<<<<< HEAD
                        width: size.width * .21,
=======
                        width: size.width * 0.21,
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
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
<<<<<<< HEAD

=======
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
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
<<<<<<< HEAD
                          dropdownColor: Colors
                              .white, // Color de fondo del menú desplegable
=======
                          dropdownColor: Colors.white,
>>>>>>> 75f870ca0cd4bdbf88b6c86cf7ddf0af9c261776
                          underline: Container(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Dirección',
                    size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'EPS',
                    size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Alergias',
                    size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Grupo',
                    size.width,
                  ),
                  const SizedBox(height: 11),
                ],
              ),
              Positioned(
                bottom: 15,
                right: 10,
                child: 
                Row(
                  children: [
                
                   Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 40, width: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/registerUser');
                            },
                            icon: const Icon(
                              Icons.circle_rounded,
                              size: 10,
                            )),
                              IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/registerUser2');
                            },
                            icon: const Icon(
                              Icons.circle_outlined,
                              size: 10,
                            )),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registerUser3');
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
                          Navigator.pushNamed(context, '/registerUser2');
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                          size: 40,
                        ))
                  ],
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
