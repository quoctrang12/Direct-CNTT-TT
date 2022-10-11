// ignore: file_names
import 'package:flutter/material.dart';
import './Search_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Tìm đường đi đến các phòng trong khoa"),
          actions: [IconSearch(context)],
          // backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/Images/TangTret.jpg',
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/Images/TangLau.jpg',
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ));
  }

  Widget IconSearch(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(SearchScreen.routeName);
      },
      icon: const Icon(Icons.search),
      color: Colors.white,
    );
  }
}
