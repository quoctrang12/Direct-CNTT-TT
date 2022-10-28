import 'package:flutter/material.dart';
import 'package:location/Search_details_screen.dart';
import 'package:location/constrain.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final from = ValueNotifier<String>('0');
  final to = ValueNotifier<String>('');
  List<String> recentlySearch = [];
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller1 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          fromInputBox(),
          toInputBox(),
          Container(
            height: MediaQuery.of(context).size.height * .6,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 20.0),
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
              Icon(
                Icons.access_time,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                matchQuery[i],
                style: poppins.copyWith(
                  fontSize: 17,
                ),
              ),
              Spacer(),
              Icon(
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
      padding: EdgeInsets.symmetric(horizontal: 15.0),
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
            hintStyle: TextStyle(
              color: blue,
            ),
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: blue,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _controller.clear();
              },
              icon: Icon(Icons.clear),
            )),
      ),
    );
  }

  Widget toInputBox() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
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
            hintStyle: TextStyle(
              color: blue,
            ),
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: blue,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _controller1.clear();
              },
              icon: Icon(Icons.clear),
            )),
      ),
    );
  }
}
