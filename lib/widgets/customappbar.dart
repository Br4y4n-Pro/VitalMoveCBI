import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

Widget bottombar(BuildContext context, int position) {
  return Container(
    decoration: BoxDecoration(
      borderRadius:
          BorderRadius.circular(20), // ajusta el radio según sea necesario
    ),
    child: Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colores.primaryColor,
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
        height: 10,
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.home, 1, position == 1),
            _buildBottomNavItem(Icons.call, 2, position == 2),
            _buildBottomNavItem(Icons.bar_chart, 3, position == 3),
            _buildBottomNavItem(Icons.person, 4, position == 4),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBottomNavItem(IconData icon, int index, bool isSelected) {
  return Container(
    width: 60,
    height: 40,
    decoration: BoxDecoration(
      // ignore: prefer_const_constructors
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: isSelected ? Colors.white : Colors.transparent,
    ),
    child: IconButton(
      icon:
          Icon(icon, color: isSelected ? Colors.blue : Colores.quaternaryColor),
      onPressed: () => _onItemTapped(index),
    ),
  );
}

_onItemTapped(int index) {
  // Aquí maneja la acción según el índice seleccionado
}
