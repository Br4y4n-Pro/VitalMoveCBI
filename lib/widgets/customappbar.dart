import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

Widget bottombar({
  required int currentIndex,
  required Function(int) onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colores.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(1, 1),
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
            _buildBottomNavItem(Icons.home, 0, currentIndex == 0, onTap),
            _buildBottomNavItem(Icons.call, 1, currentIndex == 1, onTap),
            _buildBottomNavItem(Icons.bar_chart, 2, currentIndex == 2, onTap),
            _buildBottomNavItem(Icons.person, 3, currentIndex == 3, onTap),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBottomNavItem(
    IconData icon, int index, bool isSelected, Function(int) onTap) {
  return Container(
    width: 60,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: isSelected ? Colors.white : Colors.transparent,
    ),
    child: IconButton(
      icon:
          Icon(icon, color: isSelected ? Colors.blue : Colores.quaternaryColor),
      onPressed: () => onTap(index),
    ),
  );
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 1:
      Navigator.pushNamed(context, "/homeUsuario");
      break;
    case 2:
      Navigator.pushNamed(context, '/contact');
      break;
    case 3:
      Navigator.pushNamed(context, '/estadisticas');
      break;
    case 4:
      Navigator.pushNamed(context, '/perfil');
      break;
    default:
  }
}
