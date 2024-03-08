import 'package:flutter/material.dart';
//import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class Estadisticas extends StatefulWidget {
  const Estadisticas({super.key});

  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        title: const Text(
          'Estadisticas',
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: ListView(children: [
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/pageCaminata');
          },
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/caminar.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: const Center(
                    child: Text(
                      "Caminata",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ))),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/pageBruce');
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/bruce.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: const Center(
                    child: Text(
                      "Bruce",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ))),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/pagePeso');
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/peso.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: const Center(
                    child: Text(
                      "Peso",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ))),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/pageVOdos');
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/Vo2.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: const Center(
                    child: Text(
                      "Vo2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ))),
        ),
      ]),
    );
  }
}
