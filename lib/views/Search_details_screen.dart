import 'dart:math';
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:location/constrain.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import '../controller/Manager.dart';

class SearchDetailScreen extends StatefulWidget {
  final String from, to;
  const SearchDetailScreen({Key? key, this.from = "0", required this.to})
      : super(key: key);

  @override
  State<SearchDetailScreen> createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static final linearTween = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * .8;
    final listRoom =
        ManagerRoom(width, height).searchRoom(from: widget.from, to: widget.to);
    final index = listRoom.indexWhere((element) =>
        element == 1 || element == 2 || element == 3 || element == 4);
    List map = [];
    var err = false;
    try {
      if (index == -1 || index == 0) {
        if (ManagerRoom(width, height).offset_1.containsKey(listRoom[1])) {
          map.add({
            "listRoom": listRoom,
            "offset": ManagerRoom(width, height).offset_1,
            "image": "assets/Images/TangTret.jpg",
          });
        } else {
          map.add({
            "listRoom": listRoom,
            "offset": ManagerRoom(width, height).offset_2,
            "image": "assets/Images/TangLau.jpg",
          });
        }
      } else {
        if (ManagerRoom(width, height).offset_1.containsKey(
              listRoom.sublist(0, index).first,
            )) {
          map.addAll(
            {
              {
                "listRoom": listRoom.sublist(0, index + 1),
                "offset": ManagerRoom(width, height).offset_1,
                "image": "assets/Images/TangTret.jpg",
              },
              {
                "listRoom": listRoom.sublist(index),
                "offset": ManagerRoom(width, height).offset_2,
                "image": "assets/Images/TangLau.jpg",
              }
            },
          );
        } else {
          map.addAll(
            {
              {
                "listRoom": listRoom.sublist(0, index + 1),
                "offset": ManagerRoom(width, height).offset_2,
                "image": "assets/Images/TangLau.jpg",
              },
              {
                "listRoom": listRoom.sublist(index),
                "offset": ManagerRoom(width, height).offset_1,
                "image": "assets/Images/TangTret.jpg",
              }
            },
          );
        }
      }
    } catch (e) {
      err = true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text("Từ ${widget.from} đến ${widget.to}"),
      ),
      body: SingleChildScrollView(
        child: !err
            ? Column(
                children: List.generate(
                  map.length,
                  (i) => Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .94,
                        height: (ManagerRoom(width, height)
                                    .route(map[i]['listRoom'], map[i]['offset'])
                                    .length +
                                1) *
                            45,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ManagerRoom(width, height)
                                  .route(
                                    map[i]['listRoom'],
                                    map[i]['offset'],
                                  )
                                  .length +
                              1,
                          itemBuilder: (ctx, index) {
                            List path = ManagerRoom(width, height).route(
                              map[i]['listRoom'],
                              map[i]['offset'],
                            );
                            path.add({
                              "title":
                                  "Đến ${map[i]['listRoom'].last < 100 ? ManagerRoom(width, height).codetoName(map[i]['listRoom'].last) : "phòng ${map[i]['listRoom'].last}"}",
                              "icon": Typicons.arrow_up_outline,
                            });
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    path[index]["icon"],
                                    color: blue,
                                    size: 30,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      path[index]["title"],
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
                              ),
                            );
                          },
                        ),
                      ),
                      Stack(children: [
                        buildMap(
                          context,
                          map[i]['image'],
                          map[i]['listRoom'],
                          map[i]['offset'],
                        ),
                        if (map.length > 1 && i == 0)
                          Positioned(
                            bottom: 0,
                            left: 150,
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        AnimatedBuilder(
                                          animation: _controller,
                                          builder: (context, child) {
                                            return Align(
                                              alignment: Alignment(
                                                0,
                                                lerpDouble(
                                                    1,
                                                    -1,
                                                    linearTween
                                                        .chain(linearTween
                                                            .chain(CurveTween(
                                                                curve:
                                                                    const SineCurve())))
                                                        .evaluate(
                                                            _controller))!,
                                              ),
                                              child: child,
                                            );
                                          },
                                          child: SizedBox(
                                            height: 80,
                                            child: ColorFiltered(
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      blue, BlendMode.srcIn),
                                              child: Image.asset(
                                                  'assets/Images/continue.png'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Container(),
                      ])
                    ],
                  ),
                ),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Center(
                  child: Text(
                    "Chưa tìm được đường đi. ",
                    style: poppins.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: blue,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "\Vui lòng thử lại!! ",
                    style: poppins.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: blue,
                    ),
                  ),
                ),
              ]),
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
            foregroundPainter: Painter(
              listRoom: listRoom,
              listOffset: listOffset,
            ),
          )
        ],
      ),
    );
  }
}

class Painter extends CustomPainter {
  final List listRoom;
  final Map listOffset;

  Painter({required this.listRoom, required this.listOffset});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint yellowPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9;
    final to =
        Offset(listOffset[listRoom.last]["x"], listOffset[listRoom.last]["y"]);
    final from = Offset(
        listOffset[listRoom.first]["x"], listOffset[listRoom.first]["y"]);
    Path path = Path()..moveTo(from.dx, from.dy);
    listRoom.forEach((e) {
      return path.lineTo(listOffset[e]["x"], listOffset[e]["y"]);
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

class SineCurve extends Curve {
  const SineCurve({this.count = 3});

  final double count;

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    // var val = sin(2 * pi * t);
    return val; //f(x)
  }
}
