import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/provider/testbruce/BruceFromProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/ProviderBruce.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';

class TestBruceMod extends StatefulWidget {
  const TestBruceMod({Key? key}) : super(key: key);

  @override
  State<TestBruceMod> createState() => _TestBruceMod();
}

class _TestBruceMod extends State<TestBruceMod> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String dropdownValue = 'Etapa';
  String? rhType;

  String dropdownValuesrh = 'Seleccione etapa';

  var itemsetapa = [
    'Seleccione etapa',
    'Etapa 1',
    'Etapa 2',
    'Etapa 3',
    'Etapa 4',
    'Etapa 5',
    'Etapa 6',
    'Etapa 7',
    'Etapa 8',
    'Etapa 9',
  ];

  @override
  Widget build(BuildContext context) {
    final fromProvider = Provider.of<BruceFromProvider>(context, listen: false);
    final provider = Provider.of<BruceProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.primaryColor,
        centerTitle: true,
        title: const Text(
          "Test Bruce",
          style: TextStyle(
            color: Colores.quaternaryColor,
          ),
        ),
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
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
                  const SizedBox(height: 50),
                  Consumer(
                    builder: (context, value, child) => InputLogin(
                        onChanged: (value) => fromProvider.saturacion = value,
                        campo: "Saturación",
                        tamano: size.width,
                        tipo: TextInputType.number),
                  ),
                  const SizedBox(height: 20),
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
                      value: dropdownValuesrh,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      alignment: Alignment.bottomLeft,
                      items: itemsetapa.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValuesrh = newValue!;
                          rhType = newValue;
                          fromProvider.etapa = newValue;
                        });
                      },
                      dropdownColor: Colors.white,
                      underline: Container(),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
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
                      onPressed: () async {
                        try {
                          provider.bruce(fromProvider, context);
                        } catch (error) {
                          print('Error al enviar la solicitud: $error');
                        }
                      },
                      child: const Text('Guardar Registro'),
                    ),
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

// void _mostrarDialogo(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Guardado exitosamente'),
//         content: const Text('Resultados Test De Bruce '),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.pushNamed(context, '/');
//             },
//             child: const Text('Realizar Test De Caminata '),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.pushNamed(context, '/Bruce');
//             },
//             child: const Text('Realizar Test De Bruce Nuevamente'),
//           ),
//         ],
//       );
//     },
//   );
// }
