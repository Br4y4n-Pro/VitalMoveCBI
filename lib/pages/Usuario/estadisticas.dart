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
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * .1,
          vertical: size.height * .2,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageCaminata');
              },
              child: barraInfo("Caminatas"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageBruce');
              },
              child: barraInfo("Tests Bruces"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pagePeso');
              },
              child: barraInfo("Peso"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageVOdos');
              },
              child: barraInfo("Consumo VO2"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageIMC');
              },
              child: barraInfo("IMC"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget barraInfo(String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        )
      ],
    );
  }
}
