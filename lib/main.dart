import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Evaluador/RegistroUsuario.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitalMoveCBI',
      initialRoute: '/',
      routes: {
        // '/': (context) => UsuarioLogin(),
         '/': (context) => RegistroUsuario(),

        // '/evaluador': (context) => RegistroUsuario(),
        '/evaluadorHome': (context) => HomeEvaluador(),
        '/usuarioLogin': (context) => LoginPage(),
        '/homeUsuario': (context) => HomeUsuario(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      },
    );
  }
}

