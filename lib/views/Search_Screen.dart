import 'package:flutter/material.dart';
import 'package:location/views/Search_details_screen.dart';
import 'package:location/constrain.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final from = ValueNotifier<String>('');
  final to = ValueNotifier<String>('');
  List<String> recentlySearch = [];
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller1 = new TextEditingController();
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
      child: TextField(
        controller: _controller,
        onSubmitted: ((value) {
          if (value.isNotEmpty && to.value.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchDetailScreen(from: from.value, to: to.value),
              ),
            );
          }
        }),
        onChanged: (value) {
          from.value = value;
        },
        decoration: InputDecoration(
            hintText: "Vị trí của bạn",
            prefixIcon: Icon(
              Icons.person_outline_rounded,
              color: blue,
            ),
            hintStyle: const TextStyle(
              color: blue,
            ),
            border: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: blue,
              ),
            ),
            suffixIcon: from.value != ''
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null),
      ),
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
      child: TextField(
        controller: _controller1,
        onSubmitted: ((value) {
          if (value.isNotEmpty) {
            recentlySearch.add(value);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchDetailScreen(from: from.value, to: to.value),
              ),
            );
          }
        }),
        onChanged: (value) {
          to.value = value;
        },
        decoration: InputDecoration(
            hintText: "Vị trí muốn đến",
            prefixIcon: Icon(
              Icons.location_on_outlined,
              color: red,
            ),
            hintStyle: const TextStyle(
              color: blue,
            ),
            border: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: blue,
              ),
            ),
            suffixIcon: to.value != ''
                ? IconButton(
                    onPressed: () {
                      _controller1.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null),
      ),
    );
  }
}
