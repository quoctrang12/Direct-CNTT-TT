import 'package:flutter/material.dart';
import 'package:location/Home_screen.dart';
import './constrain.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Image.asset("assets/icons/icon.png")),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 50),
                width: MediaQuery.of(context).size.width * .75,
                color: white,
                child: Text(
                  "Chào mừng đến \n Trường Công nghệ thông tin và Truyền thông",
                  style: poppins.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
              },
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .6,
                  decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 3),
                            color: blue,
                            spreadRadius: 0,
                            blurRadius: 5)
                      ]),
                  child: Center(
                    child: Text(
                      'Tiếp tục',
                      style: poppins.copyWith(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
