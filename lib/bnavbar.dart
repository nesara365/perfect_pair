import 'package:flutter/material.dart';

class BNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BNavbar({required this.currentIndex, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About',
        ), // Added About item
      ],
      currentIndex: currentIndex,
      selectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: const Color.fromARGB(255, 185, 185, 198),
      backgroundColor: const Color.fromARGB(255, 37, 110, 220),
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
    );
  }
}
