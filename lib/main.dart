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
<<<<<<< HEAD
      initialRoute: '/buscarPersona',
=======
      initialRoute: '/registerUser',
>>>>>>> df384cfd7ea8e1e8d25f176c77a941c7249e5ace
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
<<<<<<< HEAD
        '/perfilInformativo': (context) => const PerfilInformativo(),
        '/buscarPersona': (context) => const BuscarPersona(),
=======
        '/configuracion': (context) => const Configuracion(),
        '/pageTestB': (context) => const Testbruce(),
        '/pageTests': (context) => const Tests(),
>>>>>>> df384cfd7ea8e1e8d25f176c77a941c7249e5ace
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UsuarioLogin(),
        );
      },
    );
  }
}
