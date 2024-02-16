import 'package:flutter/material.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Evaluador/AcercaDe.dart';
import 'package:vitalmovecbi/pages/Evaluador/testC6M.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminataFCR.dart';

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
        '/registerUser3': (context) => const RegistroUsertres(),
        '/registerUser2': (context) => const RegistroUserdos(),
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
        '/perfilInformativo': (context) => const PerfilInformativo(),
        '/buscarPersona': (context) => const BuscarPersona(),
        '/configuracion': (context) => const Configuracion(),
        '/pageTestB': (context) => const Testbruce(),
        '/pageTests': (context) => const Tests(),
        '/pageTestCaminataFCR': (context) => const TestCaminataFCR(),
        '/pageTestC6M': (context) => const TestC6M(),
         '/pageAcercaDe': (context) => const AcercaDe(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UsuarioLogin(),
        );
      },
    );
  }
}
