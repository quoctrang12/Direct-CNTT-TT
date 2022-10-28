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
    List path =
        ManagerRoom().route(listRoom.first, listRoom.last, listRoom, [])!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text("Từ ${from} đến ${to}"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                              path[i]["title"],
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
            Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/Images/TangTret.jpg",
                  ),
                  fit: BoxFit.fitHeight,
                  scale: 1.2,
                ),
              ),
              child: Stack(
                children: [
                  CustomPaint(
                    foregroundPainter: VietNamFlagPainter(
                        listRoom: ManagerRoom().searchRoom(from: from, to: to)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VietNamFlagPainter extends CustomPainter {
  final List listRoom;

  VietNamFlagPainter({required this.listRoom});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint yellowPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final from = Offset(ManagerRoom().offset[listRoom.first]["x"],
        ManagerRoom().offset[listRoom.first]["y"]);
    final to = Offset(ManagerRoom().offset[listRoom.last]["x"],
        ManagerRoom().offset[listRoom.last]["y"]);

    Path path = Path()..moveTo(from.dx, from.dy);
    listRoom.forEach((e) {
      return path.lineTo(
          ManagerRoom().offset[e]["x"], ManagerRoom().offset[e]["y"]);
    });
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
