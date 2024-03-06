import 'package:flutter/material.dart';
import 'package:vitalmovecbi/pages/Evaluador/homeEvaluador.dart';
import 'package:vitalmovecbi/pages/Evaluador/tests.dart';
import 'package:vitalmovecbi/pages/Evaluador/BuscarPersona.dart';
import 'package:vitalmovecbi/pages/Evaluador/pageViewUser.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';

class Evaluador extends StatefulWidget {
  const Evaluador({super.key});

  @override
  _EvaluadorState createState() => _EvaluadorState();
}

class _EvaluadorState extends State<Evaluador> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

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
          pageSnapping: true,
          controller: pageController,
          children: [
            HomeEvaluador(),
            Tests(),
            BuscarPersona(),
            Registro(),
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
