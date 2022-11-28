import 'package:flutter/material.dart';
import 'package:location/views/Onboard_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Location CNTT&TT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardScreen(),
    );
  }
}
