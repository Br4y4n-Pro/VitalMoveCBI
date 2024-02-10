import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';

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
        '/': (context) => LoginPage(),
        // '/evaluadorHome': (context) => (),
        '/usuarioLogin': (context) => UsuarioLogin(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      },
    );
  }
}
