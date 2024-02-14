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
      initialRoute: '/usuarioLogin',
      routes: {
        '/registerUser': (context) => const RegistroUsuario(),
        '/homeUsuario': (context) => const HomeUser(),
        '/contact': (context) => const PerfilVistaContact(),
        '/perfil': (context) => const PerfilVista(),
        '/evaluadorHome': (context) => const HomeEvaluador(),
        '/usuarioLogin': (context) => const UsuarioLogin(),
        '/estadisticas': (context) => const Estadisticas(),
        '/pageBruce': (context) => const PageBruces(),
        '/pageCaminata': (context) => const PageCaminata(),
        '/pageVOdos': (context) => const ConsumoVo(),
        '/pageIMC': (context) => const PageIMC(),
        '/pagePeso': (context) => const PagePeso(),
        '/pageTestB': (context) => const Testbruce(),
        '/pageTests': (context) => const Tests(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UsuarioLogin(),
        );
      },
    );
  }
}
