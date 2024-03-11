import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Evaluador/testBruceMod.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminata.dart';
import 'package:vitalmovecbi/provider/caminata/ProviderCaminata.dart';
import 'package:vitalmovecbi/provider/caminata/caminataFromProvider.dart';
import 'package:vitalmovecbi/provider/caminata/gets/providerGetCaminata.dart';
import 'package:vitalmovecbi/provider/login/LoginFromProvider.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/provider/registro/ProviderRegistro.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/BruceFromProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/ProviderBruce.dart';
import 'package:vitalmovecbi/provider/usuarios/UsuarioFromProvider.dart';
import 'package:vitalmovecbi/provider/usuarios/providerUsuarios.dart';

import 'services/localStorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();
  await LocalStorage.configurePrefs();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        //--------- provider login --------------
        ChangeNotifierProvider(lazy: false, create: (_) => LoginProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => LoginFromProvider()),

        ChangeNotifierProvider(lazy: false, create: (_) => UsuarioProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => UsuarioFromProvider()),

        ChangeNotifierProvider(lazy: false, create: (_) => RegistroProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => RegistroFromProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => BruceProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => BruceFromProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => ProviderCaminata()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => CaminataFromProvider()),

        ChangeNotifierProvider(
            lazy: false, create: (_) => CaminataGetProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic usuario;
    return AdaptiveTheme(
        light: ThemeData.light(useMaterial3: true),
        dark: ThemeData.dark(useMaterial3: true),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darktheme) {
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
              '/perfil': (context) => const PerfilVista(),
              '/evaluadorHome': (context) => const HomeEvaluador(),
              '/estadisticas': (context) => const Estadisticas(),
              '/pageBruce': (context) => const PageBruces(),
              '/pageCaminata': (context) => const PageCaminata(),
              '/pageVOdos': (context) => const ConsumoVo(),
              '/pageIMC': (context) => const PageIMC(),
              '/pagePeso': (context) => const PagePeso(),
              '/perfilInformativo': (context) =>
                  PerfilInformativo(usuario: usuario),
              '/buscarPersona': (context) => const BuscarPersona(),
              '/configuracion': (context) => const Configuracion(),
              '/pageTestB': (context) => const Testbruce(),
              '/pageTests': (context) => const Tests(),
              '/pageTestCaminataFCR': (context) =>
                  TestCaminataFCR(usuario: usuario),
              '/pageTestC6M': (context) => const TestC6M(),
              '/pageAcercaDe': (context) => const AcercaDe(),
              '/pageTestC': (context) => const TestCaminata(),
              '/pageTestBM': (context) => TestBruceMod(usuario: usuario),
              '/TB': (context) => const BruceTest(),
              '/pageviewUser': (context) => const Registro(),
              '/pageViewHome': (context) => const PageHome(),
              '/pageviewsEvaluador': (context) => const PageViewEvaluador(),
            },
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const UsuarioLogin(),
              );
            },
          );
        });
  }
}
