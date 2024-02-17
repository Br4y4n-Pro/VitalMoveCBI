import 'package:flutter/material.dart';

Widget bottombar() {
  return Container(
    decoration: BoxDecoration(
      borderRadius:
          BorderRadius.circular(20), // ajusta el radio según sea necesario
      color: Colors.white, // cambia el color de fondo si es necesario
    ),
    child: Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFADE8F4),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), // Color de la sombra
            spreadRadius: 2, // Cuánto se extiende la sombra
            blurRadius: 7, // Suavidad de la sombra
            offset: const Offset(1, 1), // Desplazamiento de la sombra
          ),
        ],
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 60,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: IconButton(
                icon: const Icon(Icons.home, color: Color(0xff0096C7)),
                onPressed: () => _onItemTapped(false),
              ),
            ),
            Container(
              width: 60,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: IconButton(
                icon: const Icon(Icons.call, color: Color(0xff0096C7)),
                onPressed: () => _onItemTapped(false),
              ),
            ),
            Container(
              width: 60,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: IconButton(
                icon: const Icon(Icons.bar_chart, color: Color(0xff0096C7)),
                onPressed: () => _onItemTapped(false),
              ),
            ),
            Container(
              width: 60,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: IconButton(
                // icon: Icon(Icons.search, color: _selectedIndex == 1 ? Colors.blue : Colors.white), // Cambia el color según la pantalla seleccionada
                icon: const Icon(Icons.person, color: Color(0xff0096C7)),
                onPressed: () => _onItemTapped(true),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

_onItemTapped(bool bool) {}
