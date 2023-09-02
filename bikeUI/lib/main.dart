import 'package:bikebyme/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff708985),
        scaffoldBackgroundColor: const Color(0xff5d716f),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
