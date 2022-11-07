import "package:flutter/material.dart";
import 'package:location/constrain.dart';
import "./Manager.dart";
import 'package:typicons_flutter/typicons_flutter.dart';

class SearchDetailScreen extends StatelessWidget {
  final String from, to;
  const SearchDetailScreen({Key? key, this.from = "0", required this.to})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listRoom = ManagerRoom().searchRoom(from: from, to: to);
    final index = listRoom.indexWhere((element) =>
        element == 1 || element == 2 || element == 3 || element == 4);
    List map = [];
    if (index == -1 || index == 0) {
      if (ManagerRoom().offset_1.containsKey(listRoom.last)) {
        map.add({
          "listRoom": listRoom,
          "offset": ManagerRoom().offset_1,
          "image": "assets/Images/TangTret.jpg",
        });
      } else {
        map.add({
          "listRoom": listRoom,
          "offset": ManagerRoom().offset_2,
          "image": "assets/Images/TangLau.jpg",
        });
      }
    } else {
      if (ManagerRoom()
          .offset_1
          .containsKey(listRoom.sublist(0, index).first)) {
        map.addAll(
          {
            {
              "listRoom": listRoom.sublist(0, index + 1),
              "offset": ManagerRoom().offset_1,
              "image": "assets/Images/TangTret.jpg",
            },
            {
              "listRoom": listRoom.sublist(index),
              "offset": ManagerRoom().offset_2,
              "image": "assets/Images/TangLau.jpg",
            }
          },
        );
      } else {
        map.addAll(
          {
            {
              "listRoom": listRoom.sublist(0, index + 1),
              "offset": ManagerRoom().offset_2,
              "image": "assets/Images/TangLau.jpg",
            },
            {
              "listRoom": listRoom.sublist(index),
              "offset": ManagerRoom().offset_1,
              "image": "assets/Images/TangTret.jpg",
            }
          },
        );
      }
    }
    List path =
        ManagerRoom().route(listRoom.first, listRoom.last, listRoom, [])!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text("Từ ${from} đến ${to}"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .94,
              height: 100,
              child: ListView.builder(
                  itemCount: path.length,
                  itemBuilder: (ctx, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          path[i]["icon"],
                          color: blue,
                          size: 30,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            // path[i]["title"],
                            ManagerRoom()
                                .searchRoom(from: from, to: to)
                                .toString(),
                            style: poppins.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: red,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Column(
                children: List.generate(
                  map.length,
                  (i) => buildMap(
                    context,
                    map[i]['image'],
                    map[i]['listRoom'],
                    map[i]['offset'],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMap(
      BuildContext context, String linkImage, List listRoom, Map listOffset) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            linkImage,
          ),
          fit: BoxFit.fitHeight,
          scale: 1.2,
        ),
      ),
      child: Stack(
        children: [
          CustomPaint(
            foregroundPainter: VietNamFlagPainter(
              listRoom: listRoom,
              listOffset: listOffset,
            ),
          )
        ],
      ),
    );
  }
}

class VietNamFlagPainter extends CustomPainter {
  final List listRoom;
  final Map listOffset;

  VietNamFlagPainter({required this.listRoom, required this.listOffset});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint yellowPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final to =
        Offset(listOffset[listRoom.last]["x"], listOffset[listRoom.last]["y"]);
    final from = Offset(
        listOffset[listRoom.first]["x"], listOffset[listRoom.first]["y"]);
    Path path = Path()..moveTo(from.dx, from.dy);
    listRoom.forEach((e) {
      return path.lineTo(listOffset[e]["x"], listOffset[e]["y"]);
    });
    // final from = Offset(
    //   ManagerRoom().offset_2[42]["x"],
    //   ManagerRoom().offset_2[42]["y"],
    // );
    // Path path = Path()..moveTo(from.dx, from.dy);
    // path.lineTo(
    //   ManagerRoom().offset_2[43]["x"],
    //   ManagerRoom().offset_2[43]["y"],
    // );
    // ManagerRoom().offset.forEach((key, value) {
    //   return path.lineTo(value['x'], value['y']);
    // });
    canvas.drawPath(path, yellowPaint);
    //
    const iconStart = Icons.person;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconStart.codePoint),
        style: TextStyle(
            fontSize: 30.0, fontFamily: iconStart.fontFamily, color: red));
    textPainter.layout();
    textPainter.paint(canvas, Offset(from.dx - 15, from.dy - 15));
    //
    const iconEnd = Icons.location_on;
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconEnd.codePoint),
        style: TextStyle(
            fontSize: 30.0, fontFamily: iconEnd.fontFamily, color: red));
    textPainter.layout();
    textPainter.paint(canvas, Offset(to.dx - 15, to.dy - 15));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
