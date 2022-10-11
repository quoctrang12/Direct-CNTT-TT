import 'package:flutter/material.dart';
import 'package:location/Search_details_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = ValueNotifier<String>('');
  List<int> pairsList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        title: SearchBox(),
        iconTheme: IconThemeData(
          color: Color(0xFF0C9869).withOpacity(0.5),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Center(
          child: ValueListenableBuilder<String>(
            valueListenable: search,
            builder: ((context, value, child) => SearchListView(pairsList)),
          ),
          // builder: ((context, value, child) => Text(value)),
        ),
        // child:
      ),
    );
  }

  Widget SearchListView(List pairsList) {
    List<int> matchQuery = [];
    for (var fruit in pairsList) {
      String room = "Phòng " + fruit.toString();
      if (room.toLowerCase().contains(search.value.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text("Phòng " + matchQuery[i].toString()),
          onTap: () {
            Navigator.of(context).pushNamed(
              SearchDetailScreen.routeName,
              arguments: matchQuery[i],
            );
          },
        );
      },
    );
  }

  Widget IconSearch() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search),
      color: Color(0xFF0C9869).withOpacity(0.5),
    );
  }

  Widget SearchBox() {
    return Container(
      margin: EdgeInsets.only(right: 0.0),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 58,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        onSubmitted: ((value) {
          if (!value.isEmpty) {
            String searchRoom = value.substring(value.indexOf(' ') + 1);
            var Room = int.parse(searchRoom);

            print(Room);
            Navigator.of(context).pushNamed(
              SearchDetailScreen.routeName,
              arguments: Room,
            );
          }
        }),
        onChanged: (value) {
          search.value = value;
        },
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Color(0xFF0C9869).withOpacity(0.5),
            ),
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF0C9869).withOpacity(0.5),
              ),
            ),
            suffixIcon: IconSearch()),
      ),
    );
  }
}
