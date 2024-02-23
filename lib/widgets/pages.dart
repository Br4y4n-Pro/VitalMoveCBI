import 'package:flutter/material.dart';

class MyPagesWidget extends StatefulWidget {
  const MyPagesWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPagesWidgetState createState() => _MyPagesWidgetState();
}

class _MyPagesWidgetState extends State<MyPagesWidget> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: true,
        controller: pageController, // Asigna el PageController al PageView
        children: [
          _buildPage(
            "Peso saludable",
            "El cuerpo cambia a medida que envejecemos. Por ejemplo, si usted no es muy activo, es posible que sus músculos no funcionen tan bien y eso puede afectar su fuerza. Además, es posible que queme menos calorías, especialmente si no hace ninguna actividad física. Con el tiempo, si come y bebe más calorías de las que su cuerpo quema durante la actividad física y la vida diaria, su cuerpo podría almacenar las calorías extras que causan el aumento de peso. El peso extra puede causar sobrepeso u obesidad.",
          ),
          _buildPage("Page 2", "Information for Page 2"),
          _buildPage("Page 3", "Information for Page 3"),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String information) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 242, 242),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              information,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 48, 48, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
