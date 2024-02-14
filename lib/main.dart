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

         '/': (context) => RegistroUsuario(),
        '/homeUsuario': (context) => const HomeUser(),
        '/contact': (context) => const PerfilVistaContact(),
        '/perfil': (context) => const PerfilVista(),
        '/evaluador': (context) => const EvaluadorLogin(),
        '/evaluadorHome': (context) => const HomeEvaluador(),
        '/usuarioLogin': (context) => const LoginPage(),
        '/estadisticas': (context) => const Estadisticas(),
        '/pageBruce': (context) => const PageBruces(),
        '/pageCaminata': (context) => const PageCaminata(),
        '/pageVOdos': (context) => const ConsumoVo(),
        '/pageIMC': (context) => const PageIMC(),
        '/pagePeso': (context) => const PagePeso(),

      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      },
    );
  }
}
