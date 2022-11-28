import 'dart:math';

import 'package:dijkstra/dijkstra.dart';
import 'package:flutter/widgets.dart';
import 'package:tiengviet/tiengviet.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ManagerRoom {
  final Map _graph = {
    0: {1: 130, 2: 70, 12: 55, 13: 180, 30: 140, 31: 222},
    1: {0: 130, 13: 60, 49: 80, 61: 62, 62: 70, 64: 50, 50: 140},
    2: {0: 70, 12: 70, 50: 70, 52: 20, 60: 50, 38: 50},
    3: {37: 40},
    4: {34: 30, 47: 40},
    1005: {31: 62, 34: 80},
    2005: {47: 80, 48: 60},
    11: {12: 93, 35: 45},
    12: {0: 55, 2: 70, 11: 112},
    13: {0: 180, 1: 60, 31: 110},
    14: {32: 20, 110: 62},
    15: {16: 62, 33: 30},
    16: {15: 62, 17: 62},
    17: {16: 62, 18: 62},
    18: {17: 62, 19: 62},
    19: {18: 62, 20: 62, 107: 170},
    20: {19: 62},
    21: {33: 40, 34: 62},
    30: {0: 140, 31: 172, 100: 40, 101: 62, 38: 70},
    31: {1005: 62, 13: 110, 30: 172, 0: 302},
    32: {14: 20, 103: 50, 104: 12},
    33: {15: 30, 21: 40, 111: 42},
    34: {4: 30, 1005: 93, 21: 62},
    35: {11: 45, 36: 80, 100: 20},
    36: {35: 80, 37: 296},
    37: {3: 40, 36: 296},
    38: {30: 70, 2: 50},
    100: {30: 40, 35: 20},
    101: {30: 62, 102: 62},
    102: {101: 62, 103: 62},
    103: {102: 62, 32: 50},
    104: {32: 12, 105: 62},
    105: {104: 62, 106: 62},
    106: {105: 62, 107: 62},
    107: {106: 62, 108: 62, 19: 170},
    108: {107: 62, 109: 62},
    109: {108: 62},
    110: {14: 62, 111: 62},
    111: {110: 62, 33: 42},
    40: {41: 70, 201: 70, 52: 70},
    41: {42: 180, 40: 70},
    42: {202: 40, 41: 180, 43: 140, 51: 180, 208: 180, 206: 160, 44: 200},
    43: {210: 50, 203: 70, 202: 120, 42: 140, 206: 100, 208: 70, 51: 110},
    44: {208: 40, 209: 160, 42: 200},
    45: {213: 122, 46: 70, 212: 40, 47: 80},
    46: {45: 70, 217: 20, 218: 62},
    47: {45: 80, 4: 40, 2005: 80},
    48: {201: 200, 63: 50, 2005: 60},
    49: {63: 50, 62: 20, 61: 60, 1: 80, 64: 20},
    50: {1: 140, 2: 70, 60: 40, 52: 60},
    51: {206: 30, 204: 40, 202: 160, 42: 180, 43: 110},
    52: {2: 20, 40: 70, 60: 40, 50: 60},
    60: {52: 40, 50: 40, 2: 50},
    61: {62: 50, 49: 60, 1: 62, 64: 70},
    62: {49: 20, 61: 50, 1: 70},
    63: {48: 50, 49: 50},
    64: {49: 20, 1: 50, 61: 70},
    201: {40: 70, 48: 200},
    202: {42: 40, 43: 120, 203: 62, 51: 160, 206: 150, 208: 170},
    203: {202: 62, 43: 70, 208: 190, 206: 200},
    204: {202: 200, 51: 40, 205: 124},
    205: {204: 124, 207: 20},
    206: {202: 150, 203: 200, 208: 62, 51: 30, 42: 160, 43: 100},
    207: {205: 20},
    208: {203: 190, 202: 170, 44: 40, 206: 62, 42: 180, 43: 70},
    209: {44: 160},
    210: {211: 62, 43: 50},
    211: {212: 62, 210: 62},
    212: {45: 40, 211: 62},
    213: {214: 124, 45: 122},
    214: {213: 124, 215: 62},
    215: {214: 62, 216: 62},
    216: {215: 62},
    217: {46: 20},
    218: {46: 62, 219: 62},
    219: {218: 62, 220: 62},
    220: {219: 62, 221: 32},
    221: {220: 32},
  };

  final Map _offset_1 = {
    0: {"x": 235.7, "y": 608.2},
    1: {"x": 159.14, "y": 620.6},
    2: {"x": 261.22, "y": 571.0},
    3: {"x": 350.54, "y": 346.56},
    4: {"x": 88.96, "y": 440.8},
    1005: {"x": 120.86, "y": 496.6},
    10: {"x": 235.7, "y": 608.2},
    11: {"x": 270.79, "y": 538.76},
    12: {"x": 270.79, "y": 608.2},
    13: {"x": 120.86, "y": 595.8},
    14: {"x": 216.56, "y": 375.7},
    15: {"x": 120.86, "y": 368.88},
    16: {"x": 120.86, "y": 326.72},
    17: {"x": 120.86, "y": 288.28},
    18: {"x": 120.86, "y": 249.84},
    19: {"x": 120.86, "y": 211.4},
    20: {"x": 120.86, "y": 172.96},
    21: {"x": 120.86, "y": 403.6},
    30: {"x": 235.7, "y": 527.6},
    31: {"x": 120.86, "y": 527.6},
    32: {"x": 235.7, "y": 375.7},
    33: {"x": 120.86, "y": 375.7},
    34: {"x": 120.86, "y": 440.8},
    35: {"x": 270.79, "y": 527.6},
    36: {"x": 325.02, "y": 527.6},
    37: {"x": 325.02, "y": 346.56},
    38: {"x": 235.7, "y": 571.0},
    100: {"x": 264.41, "y": 527.6},
    101: {"x": 235.7, "y": 478.0},
    102: {"x": 235.7, "y": 439.5},
    103: {"x": 235.7, "y": 401.12},
    104: {"x": 235.7, "y": 362.88},
    105: {"x": 235.7, "y": 324.24},
    106: {"x": 235.7, "y": 285.8},
    107: {"x": 235.7, "y": 247.36},
    108: {"x": 235.7, "y": 208.92},
    109: {"x": 235.7, "y": 170.48},
    110: {"x": 184.66, "y": 375.7},
    111: {"x": 146.38, "y": 375.7},
  };

  final Map _offset_2 = {
    1: {"x": 159.14, "y": 625.2},
    2: {"x": 261.22, "y": 576.2},
    3: {"x": 350.54, "y": 346.56},
    4: {"x": 84.72, "y": 440.4},
    2005: {"x": 123.0, "y": 496.6},
    40: {"x": 284.4, "y": 530.7},
    41: {"x": 336.73, "y": 530.7},
    42: {"x": 336.73, "y": 411.7},
    43: {"x": 250.6, "y": 374.6},
    44: {"x": 242.2, "y": 308.1},
    45: {"x": 123.0, "y": 374.6},
    46: {"x": 64.3, "y": 374.6},
    47: {"x": 123.0, "y": 440.4},
    48: {"x": 123.0, "y": 530.7},
    49: {"x": 123.0, "y": 586.7},
    50: {"x": 265.3, "y": 623.8},
    51: {"x": 338.64, "y": 308.1},
    52: {"x": 284.4, "y": 576.2},
    60: {"x": 284.4, "y": 607.7},
    61: {"x": 168.9, "y": 600.7},
    62: {"x": 148.52, "y": 586.7},
    63: {"x": 123.0, "y": 558.7},
    64: {"x": 123.0, "y": 604.2},
    100: {"x": 151.7, "y": 527.6},
    201: {"x": 233.37, "y": 530.7},
    202: {"x": 309.3, "y": 411.7},
    203: {"x": 269.74, "y": 411.7},
    204: {"x": 338.65, "y": 280.1},
    205: {"x": 338.65, "y": 196.1},
    206: {"x": 309.3, "y": 308.1},
    207: {"x": 338.65, "y": 196.1},
    208: {"x": 269.74, "y": 308.1},
    209: {"x": 242.2, "y": 198.2},
    210: {"x": 231.46, "y": 374.6},
    211: {"x": 191.9, "y": 374.6},
    212: {"x": 152.35, "y": 374.6},
    213: {"x": 123.0, "y": 289.2},
    214: {"x": 123.0, "y": 209.4},
    215: {"x": 123.0, "y": 166.0},
    216: {"x": 123.0, "y": 122.6},
    217: {"x": 64.3, "y": 360.6},
    218: {"x": 64.3, "y": 317.2},
    219: {"x": 64.3, "y": 282.2},
    220: {"x": 64.3, "y": 247.2},
    221: {"x": 64.3, "y": 226.2},
  };

  Map get offset_1 {
    return _offset_1;
  }

  Map get offset_2 {
    return _offset_2;
  }

  Map get graph {
    return _graph;
  }

  List<dynamic> dijkstra({int from = 0, required int to}) {
    var dijkstra = Dijkstra.findPathFromGraph(_graph, from, to);
    return dijkstra;
  }

  int nameToCode(String title) {
    if (title.toLowerCase().startsWith("phong")) {
      return int.parse(title.substring(title.indexOf(' ') + 1));
    } else {
      switch (title.toLowerCase()) {
        case "khoa cong nghe thong tin":
          return 20;
        case "khoa tin hoc ung dung":
          return 19;
        case "khoa truyen thong da phuong tien":
          return 19;
        case "khoa mang may tinh va truyen thong":
          return 18;
        case "khoa khoa hoc may tinh":
          return 17;
        case "khoa cong nghe phan mem":
          return 16;
        case "khoa he thong thong tin":
          return 15;
        case "phong ky thuat":
          return 21;
        case "nha ve sinh tang 1":
          return 1005;
        case "nha ve sinh tang 2":
          return 2005;
        case "khong gian sang che":
          return 13;
        case "trung tam tin hoc":
          return 14;
        case "van phong khoa":
          return 12;
        case "thu vien":
          return 11;
        case "hoi truong khoa":
          return 60;
        case "van phong doan":
          return 100;
        case "sanh khoa":
          return 0;
        case "phong hop 1":
          return 61;
        case "phong hop 2":
          return 63;
        case "phong giao vien thinh giang":
          return 62;
        case "van phong bcn khoa":
          return 64;
        case "cau thang 1":
          return 1;
        case "cau thang 2":
          return 2;
        case "cau thang 3":
          return 3;
        case "cau thang 4":
          return 4;
        default:
          return int.parse(title);
      }
    }
  }

  String codetoName(int code) {
    switch (code) {
      case 20:
        return "Khoa CNTT";
      case 19:
        return "Khoa THUD";
      case 18:
        return "Khoa MMT&TT";
      case 17:
        return "Khoa KHMT";
      case 16:
        return "Khoa CNPM";
      case 15:
        return "Khoa HTTT";
      case 21:
        return "PKT";
      case 1005:
        return "Nhà vệ sinh tầng 1";
      case 2005:
        return "Nhà vệ sinh tầng 2";
      case 13:
        return "KG Sáng chế";
      case 14:
        return "TT Tin học";
      case 12:
        return "VPK";
      case 11:
        return "Thư viện";
      case 60:
        return "Hội trường khoa";
      case 61:
        return "Phòng họp 1";
      case 62:
        return "Phòng GV thỉnh giảng";
      case 63:
        return "Phòng họp 2";
      case 64:
        return "Văn phòng BCN khoa";
      case 100:
        return "VPD";
      case 0:
        return "Sảnh";
      case 1:
        return "Cầu Thang 1";
      case 2:
        return "Cầu Thang 2";
      case 3:
        return "Cầu Thang 3";
      case 4:
        return "Cầu Thang 4";
      default:
        return "Ngã rẻ";
    }
  }

  List<dynamic> searchRoom({String from = "0", required String to}) {
    to = TiengViet.parse(to);
    from = TiengViet.parse(from);
    return dijkstra(from: nameToCode(from), to: nameToCode(to));
  }

  double distance(Offset a, Offset b) {
    double sum = 0;
    sum = sqrt((a.dx - b.dx) * (a.dx - b.dx) + (a.dy - b.dy) * (a.dy - b.dy));
    return (sum / 10.0);
  }

  /// Kiểm tra 2 điểm có nằm trên 1 đường thẳng hay không?
  List? testTwoPoint(int first, int last, Map offset) {
    List path = [];
    // lấy tọa độ của first và last
    var start = Offset(offset[first]["x"], offset[first]["y"]);
    var end = Offset(offset[last]["x"], offset[last]["y"]);
    // Khoảng cách từ start đến end
    double span = distance(start, end);
    // Nếu mã phòng nhỏ hơn 100 thì chuyển thành tên ngược lại giữ nguyên
    String roomName = first < 100 ? codetoName(first) : "phòng $first";
    path.add({
      "title": "Từ $roomName đi thẳng ${span.toStringAsFixed(2)} m",
      "icon": Typicons.arrow_up_outline,
    });

    if (start.dx == end.dx || start.dy == end.dy) {
      if (start.dx > end.dx || start.dx < end.dx) {
        return path;
      }
      if (start.dy > end.dy || start.dy < end.dy) {
        return path;
      }
    }
    if (_graph[first][last] != null) {
      return path;
    }
    return null;
  }

  /// Lấy tọa độ điểm mà tại đó đường đi có rẽ hướng
  dynamic getPoint(List listPoint, Map offset) {
    for (int i = listPoint.length - 2; i > 0; i--) {
      if (testThreePoint(
              listPoint.first, listPoint[i], listPoint.last, offset) !=
          null) {
        return listPoint[i];
      }
    }
    return null;
  }

  /// Kiểm tra 3 điểm có rẽ hướng hay không
  List? testThreePoint(int first, int mid, int last, Map offset) {
    var start = Offset(offset[first]["x"], offset[first]["y"]);
    var prevEnd = Offset(offset[mid]["x"], offset[mid]["y"]);
    var end = Offset(offset[last]["x"], offset[last]["y"]);
    // Khoảng cách từ điểm giữa tới điểm cuối
    double span = distance(prevEnd, end);
    List left = [
      {
        "title": "Quẹo trái ${span.toStringAsFixed(2)} m",
        "icon": Typicons.arrow_left_outline
      }
    ];
    List right = [
      {
        "title": "Quẹo phải ${span.toStringAsFixed(2)} m",
        "icon": Typicons.arrow_right_outline
      }
    ];
    // Kiểm tra điểm đầu và điểm giửa có nằm trên 1 đường thẳng hay không
    if (testTwoPoint(first, mid, offset) != null) {
      if (start.dy == prevEnd.dy && prevEnd.dx == end.dx ||
          start.dy == prevEnd.dy && testTwoPoint(mid, last, offset) != null) {
        if (start.dx > prevEnd.dx) {
          if (prevEnd.dy < end.dy) {
            return left;
          }
          return right;
        } else {
          if (prevEnd.dy < end.dy) {
            return right;
          }
          return left;
        }
      } else if (start.dx == prevEnd.dx && prevEnd.dy == end.dy ||
          start.dx == prevEnd.dx && testTwoPoint(mid, last, offset) != null) {
        if (start.dy < prevEnd.dy) {
          if (prevEnd.dx < end.dx) {
            return left;
          }
          return right;
        } else {
          if (prevEnd.dx < end.dx) {
            return right;
          }
          return left;
        }
      }
      if (testTwoPoint(mid, last, offset) != null) {
        if (start.dx > prevEnd.dx && prevEnd.dy > end.dy ||
            start.dx < prevEnd.dx && prevEnd.dy < end.dy) {
          return right;
        }
        if (start.dx > prevEnd.dx && prevEnd.dy < end.dy ||
            start.dx < prevEnd.dx && prevEnd.dy > end.dy) {
          return left;
        }
      }
    }
    return null;
  }

  /// Hàm tìm đường đi
  List route(List listDijkstra, Map offset) {
    // Nếu mã phòng nhỏ hơn 100 thì chuyển thành tên ngược lại giữ nguyên
    String roomName = listDijkstra.first < 100
        ? codetoName(listDijkstra.first)
        : "phòng ${listDijkstra.first}";
    List path = [];
    try {
      if (testTwoPoint(listDijkstra.first, listDijkstra.last, offset) != null) {
        return testTwoPoint(listDijkstra.first, listDijkstra.last, offset)!;
      } else {
        var point = getPoint(listDijkstra, offset);
        if (point != null) {
          double span = distance(
              Offset(offset[listDijkstra.first]["x"],
                  offset[listDijkstra.first]["y"]),
              Offset(offset[point]["x"], offset[point]["y"]));
          path.add({
            "title": "Từ $roomName đi thẳng ${span.toStringAsFixed(2)} m",
            "icon": Typicons.arrow_up_outline,
          });
          for (var element in testThreePoint(
              listDijkstra.first, point, listDijkstra.last, offset)!) {
            path.add(element);
          }
          return path;
        } else {
          List left = [];
          List right = [];

          left.addAll(listDijkstra);
          while (getPoint(left, offset) == null) {
            left.removeLast();
          }
          right.addAll(listDijkstra.getRange(
              listDijkstra.indexOf(getPoint(left, offset)),
              listDijkstra.length));
          double span = distance(
              Offset(offset[listDijkstra.first]["x"],
                  offset[listDijkstra.first]["y"]),
              Offset(offset[right.first]["x"], offset[right.first]["y"]));
          path.add({
            "title": "Từ $roomName đi thẳng ${span.toStringAsFixed(2)} m",
            "icon": Typicons.arrow_up_outline,
          });
          for (var element in route(left, offset)) {
            if (!element["title"].toString().contains("đi thẳng")) {
              path.add(element);
            }
          }
          for (var element in route(right, offset)) {
            if (!element["title"].toString().contains("đi thẳng")) {
              path.add(element);
            }
          }
          return path;
        }
      }
    } catch (e) {
      return [
        {
          "title": "Chưa tìm được hướng dẫn",
          "icon": Typicons.arrow_up_outline,
        }
      ];
    }
  }
}

// ${testTwoPoint(start, prevEnd)!},
void main(List<String> args) {
  List arr = ManagerRoom().searchRoom(from: "0", to: "21");

  print(arr.runtimeType);
  // for (var i = 0; i < arr.length - 1; i++) {
  //   print(
  //       "${arr[i]} - ${arr[i + 1]} : ${ManagerRoom()._graph[arr[i]][arr[i + 1]]}");
  // }
  // print(ManagerRoom().route(arr.first, arr.last, arr, []));
  print(ManagerRoom().route(arr, ManagerRoom()._offset_1));
}

// final Map _graph = {
// Cầu thang
//     0: {1: 62, 2: 7, 12: 3, 100: 20},
//     1: {0: 62, 13: 62, },
//     2: {0: 7, 12: 5, },
//     3: {},
//     4: {5: 12, },
//     5: {13: 15, 4: 12},

// Phòng cán bộ
//     10: {},
//     11: {12: 62, },
//     12: {0: 3, 11: 62, 2: 5, },
//     13: {1: 62, 5: 15},
//     14: {102: 2, 103: 2, 104: 2, 110: 62},
//     15: {111: 5, 16: 62, },
//     16: {15: 62, 17: 62,},
//     17: {16: 62, 18: 62,},
//     18: {17: 62, 19: 62,},
//     19: {18: 62, 20: 62,},
//     20: {19: 62, },
//     21: {},
// Tầng trệt
//     100: {0: 20, 101: 41},
//     101: {100: 41, 102: 62, },
//     102: {101: 62, 103: 62, 14: 2},
//     103: {102: 62, 104: 62, 14: 2},
//     104: {103: 62, 105: 62, 14: 2},
//     105: {104: 62, 106: 62,},
//     106: {105: 62, 107: 62,},
//     107: {106: 62, 108: 62,},
//     108: {107: 62, 109: 62,},
//     109: {108: 62, },
//     110: {14: 62, 111: 62,},
//     111: {110: 62, 15: 5},
// Tầng lầu

//   };
// Sảnh: 0
// Cầu thang 1: 1
// Cầu thang 2: 2
// Cầu thang 3: 3
// Cầu thang 4: 4
// WC: 5
// Văn phòng đoàn: 100
// Hội trường: 10
// Thư viện: 11
// Văn phòng khoa: 12
// Không gian sáng chế: 13
// Trung tâm tin học: 14
// Khoa HTTT: 15
// BM CNPM: 16
// BM KHMT: 17
// BM MMT&TT: 18
// BM THUD: 19
// BM CNTT: 20
// PKT: 21
