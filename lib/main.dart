import 'package:flutter/material.dart';
import 'package:location/Home_screen.dart';
import 'package:location/Onboard_Screen.dart';
import 'package:location/Search_details_screen.dart';
import 'package:location/constrain.dart';
import 'Search_Screen.dart';

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
      // routes: {
      //   SearchScreen.routeName: (ctx) => const SafeArea(child: SearchScreen()),
      // },
      // onGenerateRoute: (settings) {
      //   if (settings.name == SearchDetailScreen.routeName) {
      //     final detail = settings.arguments as int;
      //     return MaterialPageRoute(
      //       builder: (ctx) {
      //         return SearchDetailScreen(detail);
      //       },
      //     );
      //   }
      //   return null;
      // },
    );
  }
}
