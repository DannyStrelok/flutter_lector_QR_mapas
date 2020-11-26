import 'package:flutter/material.dart';
import 'package:lector_qr/screens/home_screen.dart';
import 'package:lector_qr/screens/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lector QR',
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomeScreen(),
        "map": (BuildContext context) => MapScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple
        )
      ),
    );
  }
}
