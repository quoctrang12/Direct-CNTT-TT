import 'package:flutter/material.dart';
import 'package:location/Setting_Screen.dart';
import 'package:location/constrain.dart';
import './Search_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.search,
    Icons.settings,
  ];
  List screen = [HomeBody(), SearchScreen(), SettingScreen()];
  var selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text("Tìm đường đi đến các phòng trong khoa"),
        //   actions: [IconSearch(context)],
        //   // backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: screen[selectedPage],
        bottomNavigationBar: Container(
            height: 50,
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  icons.length,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPage = index;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            height: 60,
                            width: 50,
                            child: Column(
                              children: [
                                Icon(
                                  icons[index],
                                  color: selectedPage == index
                                      ? blue
                                      : black.withOpacity(.6),
                                ),
                                const SizedBox(height: 5),
                                selectedPage == index
                                    ? Container(
                                        height: 5,
                                        width: 5,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 8,
                                        ),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: blue),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                      )),
            )),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Trường Công nghệ thông tin và truyền thông",
          style: poppins.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: blue,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .7,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Image.asset(
                  'assets/Images/TangTret.jpg',
                  fit: BoxFit.cover,
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
        ),
      ],
    );
  }
}
