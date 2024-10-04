import 'package:flutter/material.dart';

class BNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BNavbar({required this.currentIndex, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 110, 220),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined, size: 30),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info, size: 30),
              label: 'About',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
          unselectedItemColor: const Color.fromARGB(255, 185, 185, 198),
          backgroundColor: Colors.transparent,
          onTap: onTap, // This handles the navigation based on index
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
