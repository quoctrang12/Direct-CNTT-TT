import 'package:flutter/material.dart';
import 'package:location/views/Search_details_screen.dart';
import 'package:location/constrain.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final from = ValueNotifier('');
  final to = ValueNotifier('');
  List<String> recentlySearch = [];
  final DropdownEditingController<String> _controller =
      new DropdownEditingController<String>();
  final TextEditingController _controller1 = new TextEditingController();

  final room = [
    "Phòng 100",
    "Phòng 101",
    "Phòng 102",
    "Phòng 103",
    "Phòng 104",
    "Phòng 105",
    "Phòng 106",
    "Phòng 107",
    "Phòng 108",
    "Phòng 109",
    "Phòng 110",
    "Phòng 111",
    "Phòng 201",
    "Phòng 202",
    "Phòng 203",
    "Phòng 204",
    "Phòng 205",
    "Phòng 206",
    "Phòng 207",
    "Phòng 208",
    "Phòng 209",
    "Phòng 210",
    "Phòng 211",
    "Phòng 212",
    "Phòng 213",
    "Phòng 214",
    "Phòng 215",
    "Phòng 216",
    "Phòng 217",
    "Phòng 218",
    "Phòng 219",
    "Phòng 220",
    "Phòng 211",
    "Khoa Công nghệ thông tin",
    "Khoa Hệ thống thông tin",
    "Khoa Công nghệ phần mềm",
    "Khoa Khoa học máy tính",
    "Khoa Mạng máy tính và truyền thông",
    "Khoa Tin học ứng dụng",
    "Nhà vệ sinh tầng 1",
    "Nhà vệ sinh tầng 2",
    "Thư viện",
    "Văn phòng khoa",
    "Văn phòng đoàn",
    "Không gian sáng chế",
    "Sảnh",
    "Trung tâm tin học",
    "Cầu thang 1",
    "Cầu thang 2",
    "Cầu thang 3",
    "Cầu thang 4",
    "Hội trường khoa",
    "Phòng họp 1",
    "Phòng họp 2",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              color: blue,
              child: Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Bạn muốn đi đâu?",
                      style: poppins.copyWith(
                        fontSize: 30,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            fromInputBox(),
            toInputBox(),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (to.value.isNotEmpty) {
                  recentlySearch.add(to.value);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchDetailScreen(from: from.value, to: to.value),
                    ),
                  );
                }
              },
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Tìm kiếm',
                      style: poppins.copyWith(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: ValueListenableBuilder<String>(
                  valueListenable: to,
                  builder: ((context, value, child) =>
                      searchListView(recentlySearch)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchListView(List recentlySearch) {
    List matchQuery = [];
    for (var recent in recentlySearch) {
      if (recent.toLowerCase().contains(to.value.toLowerCase())) {
        matchQuery.add(recent);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                matchQuery[i],
                style: poppins.copyWith(
                  fontSize: 17,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              )
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchDetailScreen(from: from.value, to: matchQuery[i]),
              ),
            );
          },
        );
      },
    );
  }

  Widget fromInputBox() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 58,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextDropdownFormField(
        options: room,
        onSaved: ((value) {
          if (value!.isNotEmpty && to.value.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchDetailScreen(from: from.value, to: to.value),
              ),
            );
          }
        }),
        onChanged: (dynamic value) {
          from.value = value;
        },
        decoration: const InputDecoration(
          hintText: "Vị trí của bạn",
          prefixIcon: Icon(
            Icons.person_outline_rounded,
            color: blue,
          ),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: blue,
            ),
          ),
          suffixIcon: Icon(Icons.clear),
        ),
        dropdownHeight: 600,
      ),
      // TextField(
      //   controller: _controller,
      //   onSubmitted: ((value) {
      //     if (value.isNotEmpty && to.value.isNotEmpty) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) =>
      //               SearchDetailScreen(from: from.value, to: to.value),
      //         ),
      //       );
      //     }
      //   }),
      //   onChanged: (value) {
      //     from.value = value;
      //   },
      //   decoration: InputDecoration(
      //       hintText: "Vị trí của bạn",
      //       prefixIcon: Icon(
      //         Icons.person_outline_rounded,
      //         color: blue,
      //       ),
      //       hintStyle: const TextStyle(
      //         color: blue,
      //       ),
      //       border: const UnderlineInputBorder(),
      //       focusedBorder: const UnderlineInputBorder(
      //         borderSide: BorderSide(
      //           color: blue,
      //         ),
      //       ),
      //       suffixIcon: from.value != ''
      //           ? IconButton(
      //               onPressed: () {
      //                 _controller.clear();
      //               },
      //               icon: const Icon(Icons.clear),
      //             )
      //           : null),
      // ),
    );
  }

  Widget toInputBox() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 58,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextDropdownFormField(
        options: room,
        onSaved: ((value) {
          if (value!.isNotEmpty && to.value.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchDetailScreen(from: from.value, to: to.value),
              ),
            );
          }
        }),
        onChanged: (dynamic value) {
          to.value = value;
        },
        decoration: const InputDecoration(
          hintText: "Vị trí muốn đến",
          prefixIcon: Icon(
            Icons.location_on_outlined,
            color: red,
          ),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: blue,
            ),
          ),
          suffixIcon: Icon(Icons.clear),
        ),
        dropdownHeight: 600,
      ),
      // TextField(
      //   controller: _controller1,
      //   onSubmitted: ((value) {
      //     if (value.isNotEmpty) {
      //       recentlySearch.add(value);
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) =>
      //               SearchDetailScreen(from: from.value, to: to.value),
      //         ),
      //       );
      //     }
      //   }),
      //   onChanged: (value) {
      //     to.value = value;
      //   },
      //   decoration: InputDecoration(
      //       hintText: "Vị trí muốn đến",
      //       prefixIcon: Icon(
      //         Icons.location_on_outlined,
      //         color: red,
      //       ),
      //       hintStyle: const TextStyle(
      //         color: blue,
      //       ),
      //       border: const UnderlineInputBorder(),
      //       focusedBorder: const UnderlineInputBorder(
      //         borderSide: BorderSide(
      //           color: blue,
      //         ),
      //       ),
      //       suffixIcon: to.value != ''
      //           ? IconButton(
      //               onPressed: () {
      //                 _controller1.clear();
      //               },
      //               icon: const Icon(Icons.clear),
      //             )
      //           : null),
      // ),
    );
  }
}
