import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalmovecbi/pages/Evaluador/testBruceMod.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminata.dart';
import 'package:vitalmovecbi/provider/registro/ProviderRegistro.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';

import 'Api/AllApi.dart';
import 'provider/login/LoginFromProvider.dart';
import 'provider/login/ProviderLogin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        //--------- provider login --------------
        ChangeNotifierProvider(lazy: false, create: (_) => LoginProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => LoginFromProvider()),

        ChangeNotifierProvider(lazy: false, create: (_) => RegistroProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => RegistroFromProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitalMoveCBI',
      theme: ThemeData(
        textTheme: GoogleFonts.fredokaTextTheme(),
      ),
      initialRoute: '/usuarioLogin',
      routes: {
        '/usuarioLogin': (context) => const UsuarioLogin(),
        '/registerUser3': (context) => const RegistroUsertres(),
        '/registerUser2': (context) => const RegistroUserdos(),
        '/registerUser': (context) => const RegistroUsuario(),
        '/homeUsuario': (context) => const HomeUser(),
        '/contact': (context) => const PerfilVistaContact(),
<<<<<<< HEAD
        '/perfil': (context) =>  PerfilVista(),
=======
        '/perfil': (context) => PerfilVista(),
>>>>>>> 588fd42291994429f93c3ca0ba5abe637f313478
        '/evaluadorHome': (context) => const HomeEvaluador(),
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
        '/pageTestC': (context) => const TestCaminata(),
        '/pageTestBM': (context) => const TestBruceMod(),
        '/TB': (context) => const BruceTest(),
        '/pageviewUser': (context) => const Registro(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UsuarioLogin(),
        );
      },
    );
  }
}
