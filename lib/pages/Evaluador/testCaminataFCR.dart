// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:vitalmovecbi/index.dart';

// class TestCaminataFCR extends StatefulWidget {
//   const TestCaminataFCR({super.key});
//   @override
//   State<TestCaminataFCR> createState() => _TestCaminataFCR();
// }

// class _TestCaminataFCR extends State<TestCaminataFCR> {
//   List<Persona> personas = [
//     Persona("Edison Cuaran", "C.C 1556458585"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Test Caminata FCR",
//           style: TextStyle(
//             color: Colores.quaternaryColor,
//           ),
//         ),
//         backgroundColor: Colores.primaryColor,
//         elevation: 1,
//         iconTheme: const IconThemeData(color: Colores.quaternaryColor),
//       ),
//       body: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           child: ListView(children: [
//             const SizedBox(height: 50),
//             const Text(
//               "Usuario seleccionado:",
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 0.1),
//                 const SizedBox(height: 20),
//                 Column(
//                   children: personas
//                       .map((persona) => Column(
//                             children: [
//                               lista(persona.nombre, persona.cedula),
//                               const SizedBox(height: 10),
//                             ],
//                           ))
//                       .toList(),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 80),
//             const Text("Ingrese su frecuencia cardiaca en reposo (FCR):",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black)),
//             const SizedBox(
//               height: 3,
//             ),
//             const SizedBox(height: 19),
//             inputLogin2("Ingrese FCR"),
//             const SizedBox(height: 19),
//             inputLogin2("Ingrese FCM]"),
//             const SizedBox(height: 19),
//             inputLogin2("Ingrese TIEMPO"),
//             const SizedBox(height: 19),
//             inputLogin2("Ingrese DISTANCIA]"),
//             const SizedBox(height: 19),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 100),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: const Size(100, 50),
//                   backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
//                   foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
//                   textStyle: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/pageTestC6M');
//                 },
//                 child: const Text('Siguiente'),
//               ),
//             ),
//           ])),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';

class TestCaminataFCR extends StatefulWidget {
  const TestCaminataFCR({Key key}) : super(key: key);

  @override
  State<TestCaminataFCR> createState() => _TestCaminataFCR();
}

class _TestCaminataFCR extends State<TestCaminataFCR> {
  List<Persona> personas = [
    Persona("Edison Cuaran", "C.C 1556458585"),
  ];

  // Controladores para los campos de entrada
  TextEditingController fcrController = TextEditingController();
  TextEditingController fcmController = TextEditingController();
  TextEditingController tiempoController = TextEditingController();
  TextEditingController distanciaController = TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando el widget se elimina
    fcrController.dispose();
    fcmController.dispose();
    tiempoController.dispose();
    distanciaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Test Caminata FCR",
          style: TextStyle(
            color: Colores.quaternaryColor,
          ),
        ),
        backgroundColor: Colores.primaryColor,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Usuario seleccionado:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0.1),
                const SizedBox(height: 20),
                Column(
                  children: personas
                      .map(
                        (persona) => Column(
                          children: [
                            lista(persona.nombre, persona.cedula),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text(
              "Ingrese su frecuencia cardiaca en reposo (FCR):",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(height: 19),
            inputLogin2("Ingrese FCR", controller: fcrController),
            const SizedBox(height: 19),
            inputLogin2("Ingrese FCM", controller: fcmController),
            const SizedBox(height: 19),
            inputLogin2("Ingrese TIEMPO", controller: tiempoController),
            const SizedBox(height: 19),
            inputLogin2("Ingrese DISTANCIA", controller: distanciaController),
            const SizedBox(height: 19),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  // Enviar los datos al backend
                  enviarDatosAlBackend(
                    fcrController.text,
                    fcmController.text,
                    tiempoController.text,
                    distanciaController.text,
                  );

                  // Navegar a la siguiente página
                  // Navigator.pushNamed(context, '/pageTestC6M');
                },
                child: const Text('Siguiente'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para enviar los datos al backend
  void enviarDatosAlBackend(
      String fcr, String fcm, String tiempo, String distancia) {
    // Aquí puedes realizar una solicitud HTTP al backend
    // por ejemplo, utilizando el paquete http
    // Ejemplo:
    // http.post('url_del_backend', body: {
    //   'fcr': fcr,
    //   'fcm': fcm,
    //   'tiempo': tiempo,
    //   'distancia': distancia,
    // });

    // Por simplicidad, no se implementa la solicitud HTTP aquí.
    // Deberás hacerlo adaptándolo a tu backend.
  }
}
