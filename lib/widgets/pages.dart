import 'package:flutter/material.dart';

PageController pageController = PageController(initialPage: 0);

pages(context) {
  return Scaffold(
    body: PageView(
      pageSnapping: true,
      children: [
        _buildPage("Peso saludable",
            " El cuerpo cambia a medida que envejecemos. Por ejemplo, si usted no es muy activo, es posible que sus músculos no funcionen tan bien y eso puede afectar su fuerza. Además, es posible que queme menos calorías, especialmente si no hace ninguna actividad física. Con el tiempo, si come y bebe más calorías de las que su cuerpo quema durante la actividad física y la vida diaria, su cuerpo podría almacenar las calorías extras que causan el aumento de peso. El peso extra puede causar sobrepeso u obesidad."),
        _buildPage("Page 2", "Information for Page 2"),
        _buildPage("Page 3", "Information for Page 3"),
      ],
    ),
  );
}

Widget _buildPage(String title, String information) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.all(1),
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 241, 242, 242),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            information,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 48, 48, 48),
            ),
          ),
        ),
      ],
    ),
  );
}
