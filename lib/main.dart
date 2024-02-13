import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Usuario/homeusuario.dart';

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
        '/homeUsuario': (context) => const HomeUser(),
        '/contact': (context) => const PerfilVistaContact(),
        '/perfil': (context) => const PerfilVista(),
        '/evaluador': (context) => const EvaluadorLogin(),
        '/evaluadorHome': (context) => const HomeEvaluador(),
        '/usuarioLogin': (context) => const LoginPage(),
        '/estadisticas': (context) => const Estadisticas(),
        '/': (context) => const LoginPage(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      },
    );
  }
}
