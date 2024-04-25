import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Api/AllApi.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/pages/Evaluador/testBruceMod.dart';
import 'package:vitalmovecbi/pages/Evaluador/testCaminata.dart';
import 'package:vitalmovecbi/provider/caminata/ProviderCaminata.dart';
import 'package:vitalmovecbi/provider/caminata/caminataFromProvider.dart';
import 'package:vitalmovecbi/provider/caminata/gets/providerGetCaminata.dart';
import 'package:vitalmovecbi/provider/peso/fromProviderPeso.dart';
import 'package:vitalmovecbi/provider/peso/get/providerGetPeso.dart';
import 'package:vitalmovecbi/provider/peso/providerPeso.dart';
import 'package:vitalmovecbi/provider/publicaciones/publicacionesFromProvider.dart';
import 'package:vitalmovecbi/provider/publicaciones/publicacionesProvider.dart';
import 'package:vitalmovecbi/provider/datosGenerales/fechaTestsProvider.dart';
import 'package:vitalmovecbi/provider/datosGenerales/historialUser.dart';
import 'package:vitalmovecbi/provider/datosGenerales/notasDiariasProvider.dart';
import 'package:vitalmovecbi/provider/login/LoginFromProvider.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/provider/recomendacionTests/ProviderRecomendacion.dart';
import 'package:vitalmovecbi/provider/recomendacionTests/gets/recomendacionOneUser.dart';
import 'package:vitalmovecbi/provider/recomendacionTests/recomendacionFromProvider.dart';
// import 'package:vitalmovecbi/provider/recoemdaciontest/ProviderRecomendacion.dart';
// import 'package:vitalmovecbi/provider/recoemdaciontest/recomendacionFromProvider.dart';
import 'package:vitalmovecbi/provider/registro/ProviderRegistro.dart';
import 'package:vitalmovecbi/provider/registro/RegistroFromProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/BruceFromProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/ProviderBruce.dart';
import 'package:vitalmovecbi/provider/testbruce/gets/providerGetBruce.dart';
import 'package:vitalmovecbi/provider/usuarios/UsuarioFromProvider.dart';
import 'package:vitalmovecbi/provider/usuarios/providerUsuarios.dart';
import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';

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
        ChangeNotifierProvider(lazy: false, create: (_) => FechaTestProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => NotasDiariasProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => HistorialProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => PublicacionFromProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => PublicacionesProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => BruceGetProvider()),

        ChangeNotifierProvider(
            lazy: false, create: (_) => CaminataGetProvider()),
        ChangeNotifierProvider(create: (_) => DarkModeProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => RecomendacionFromProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => ProviderRecomendacion()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => RecomendacionGetProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => HistorialGetProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => PesoFromProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => ProviderPeso()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);

    dynamic usuario;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitalMoveCBI',
      theme: darkModeProvider.isDarkModeEnabled
          ? ThemeData.dark()
          : ThemeData.light(), // Utiliza el estado del modo oscuro
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
        '/pageVOdos': (context) => const PageVOdos(),
        '/pageIMC': (context) => const PageIMC(),
        '/pagePeso': (context) => const PageVOdos(),
        '/perfilInformativo': (context) => PerfilInformativo(usuario: usuario),
        '/buscarPersona': (context) => const BuscarPersona(),
        '/configuracion': (context) => const Configuracion(),
        '/pageTestB': (context) => const Testbruce(),
        '/pageTests': (context) => const Tests(),
        '/pageTestCaminataFCR': (context) => TestCaminataFCR(usuario: usuario),
        '/pageAcercaDe': (context) => const AcercaDe(),
        '/pageTestC': (context) => const TestCaminata(),
        '/pageTestBM': (context) => TestBruceMod(usuario: usuario),
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
  }
}
