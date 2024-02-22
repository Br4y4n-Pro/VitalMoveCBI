// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminata.dart';
import 'package:vitalmovecbi/pages/Evaluador/testbruce.dart';

class BruceTest extends StatefulWidget {
  const BruceTest({super.key});

  @override
  State<BruceTest> createState() => _BruceTest();
}

class _BruceTest extends State<BruceTest> {
  final _formKey = GlobalKey<FormState>();
  
  get personas => null;

//bruce test error en esta list dice que estan en dos zonas y no entiendo lo que tratan

  // List<Persona> personas = [
  //   Persona("Edison Cuaran", "C.C 1556458585"),
  // ];

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Definir 'size' aquí si es necesario
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: const Text('Test De Bruce '),
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
                  const SizedBox(height: 150),
                  const Center(
                    child: Text(
                      'Text de Bruce MOD',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  inputLogin(
                    'Etapa final',
                    // size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Porcentaje (%) elevacion final',
                    // size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Velocidad Final',
                    // size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Frecuencia Cardiaca Maxima',
                    // size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'V02',
                    // size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Saturacion V02',
                    // size.width,
                  ),
                  const SizedBox(height: 50),
                  Container(
                    // width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .4, size.height * .06),
                        backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        padding: EdgeInsets.all(size.height * .002),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        _mostrarDialogo(context);
                      },
                      child: const Text('Guardar Registro'),
                    ),
                  ),
                ],
              ),
              ...personas.map((persona) => Column(
                    children: [
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Usuario seleccionado',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      lista(persona.nombre, persona.cedula),
                    ],
                  )),
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
        title: const Text('Guardado exitosamente'),
        content: const Text('Resultados Test De Bruce '),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Realizar Test De Caminata '),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/Bruce');
            },
            child: const Text('Realizar Test De Bruce Nuevamente'),
          ),
        ],
      );
    },
  );
}
