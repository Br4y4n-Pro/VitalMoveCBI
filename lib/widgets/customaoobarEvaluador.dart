// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

Widget bottombar2(BuildContext context, int position) {
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
            _buildBottomNavItem2(Icons.home, 1, position == 1),
            _buildBottomNavItem2(Icons.directions_run_sharp, 2, position == 2),
            _buildBottomNavItem2(Icons.supervised_user_circle_sharp, 3, position == 3),
            _buildBottomNavItem2(Icons.group_add_outlined, 4, position == 4),
            _buildBottomNavItem2(Icons.person_pin, 5, position == 5),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBottomNavItem2(IconData icon, int index, bool isSelected) {
  return Container(
    width: 60,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
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
