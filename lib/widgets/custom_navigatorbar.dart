import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentIndex = 0;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Mapa"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: "Direcciones"
        ),
      ],
    );
  }
}
