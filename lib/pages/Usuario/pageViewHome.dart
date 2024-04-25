// ignore_for_file: library_private_types_in_public_api, unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/pages/Usuario/homeusuario.dart';
import 'package:vitalmovecbi/pages/Usuario/perfilVistaContac.dart';
import 'package:vitalmovecbi/pages/Usuario/estadisticas.dart';
import 'package:vitalmovecbi/pages/Usuario/perfilVista.dart';
import 'package:vitalmovecbi/provider/datosGenerales/fechaTestsProvider.dart';
import 'package:vitalmovecbi/provider/datosGenerales/notasDiariasProvider.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    final fechaTestProvider =
        Provider.of<FechaTestProvider>(context, listen: false)
            .fechasOnePerson(context);
    final notasProvider =
        Provider.of<NotasDiariasProvider>(context, listen: false)
            .notadiaria(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
              height: 70,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white,
                    weight: 40,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'No puede ir atras',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ]),
              ),
            ),
          ));
        },
        child: PageView(
          physics:
              const NeverScrollableScrollPhysics(), // Deshabilitar desplazamiento horizontal
          pageSnapping: true,
          controller: pageController,
          children: const [
            HomeUser(),
            PerfilVistaContact(),
            Estadisticas(),
            PerfilVista(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: bottombar(
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
            pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
//