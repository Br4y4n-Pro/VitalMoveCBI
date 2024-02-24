// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

Widget bottombar2(BuildContext context, int position) {
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
        height: 8,
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.home, 1, position == 1, context),
            _buildBottomNavItem(
                Icons.directions_run_sharp, 2, position == 2, context),
            _buildBottomNavItem(
                Icons.supervised_user_circle_sharp, 3, position == 3, context),
            _buildBottomNavItem(
                Icons.group_add_outlined, 4, position == 4, context),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBottomNavItem(
    IconData icon, int index, bool isSelected, BuildContext context) {
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
      onPressed: () => _onItemTapped(index, context),
    ),
  );
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 1:
      Navigator.pushNamed(context, '/evaluadorHome');
      break;
    case 2:
      Navigator.pushNamed(context, '/pageTests');
      break;
    case 3:
      Navigator.pushNamed(context, '/buscarPersona');
      break;
    case 4:
      Navigator.pushNamed(context, '/registerUser');
      break;
    default:
  }
}
