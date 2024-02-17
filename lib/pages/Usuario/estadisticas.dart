import 'package:flutter/material.dart';

class Estadisticas extends StatefulWidget {
  const Estadisticas({Key? key}) : super(key: key);

  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadisticas'),
        backgroundColor: const Color(0xffADE8F4),
      ),
      body: ListView(children: [
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/pageCaminata');
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/caminar.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: Center(
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
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/bruce.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: Center(
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
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/peso.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: Center(
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
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/Vo2.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: Center(
                    child: Text(
                      "Vo2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ))),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/pageCaminata');
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("img/nivel.jpg"),
                    fit: BoxFit.fitWidth,
                  )),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: Center(
                    child: Text(
                      "Nivel Vo2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ))),
        ),
      ]),
    );
  }
}