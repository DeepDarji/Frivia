import 'package:flutter/material.dart';
import 'package:frivia/pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: 'ArchitectsDaughter',
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: GamePage(),
    );
  }
}
