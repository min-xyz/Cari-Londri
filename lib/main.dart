import 'package:flutter/material.dart';
import 'home_page.dart';
import 'page1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/satu': (context) => Page1(),
      },
    );
  }
}
