// import 'package:flutter/material.dart';
// import 'package:vitalmovecbi/index.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'VitalMoveCBI',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const RegistroDatosPersonales (),
//         '/evaluador': (context) => const EvaluadorLogin(),
//         '/evaluadorHome': (context) => const HomeEvaluador(),
//         '/usuarioLogin': (context) => const UsuarioLogin(),
//       },
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (context) => const LoginPage(),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Evaluador/RegistroUsuario.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitalMoveCBI',
      initialRoute: '/',
      routes: {
        '/': (context) => const RegistroUsuario(), // Aquí está el cambio
        '/evaluador': (context) => const EvaluadorLogin(),
        '/evaluadorHome': (context) => const HomeEvaluador(),
        '/usuarioLogin': (context) => const UsuarioLogin(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      },
    );
  }
}






