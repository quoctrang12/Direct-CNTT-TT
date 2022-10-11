import "package:flutter/material.dart";
import "./Manager.dart";

class SearchDetailScreen extends StatelessWidget {
  static const routeName = '/searchDetails';
  const SearchDetailScreen(this.detail, {super.key});
  final int detail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detail.toString()),
      ),
      body: Center(
        child: Text(ManagerRoom().toRoom(detail).toString()),
      ),
    );
  }
}
