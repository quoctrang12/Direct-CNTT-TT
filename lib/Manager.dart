import 'package:dijkstra/dijkstra.dart';
import 'package:tiengviet/tiengviet.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ManagerRoom {
  final Map _map = {
    0: {
      "left": [1, 13],
      "right": [12],
      "straight": [2, 101, 102, 103, 104, 105, 106, 107, 108, 109]
    },
    5: {
      "left": [4, 15, 16, 17, 18, 19, 20, 21],
      "right": [13],
      "straight": []
    },
    11: {
      "left": [12],
      "right": [100],
      "straight": [2]
    },
    12: {
      "left": [0, 13, 1],
      "right": [],
      "straight": [11, 100]
    },
    13: {
      "left": [],
      "right": [],
      "straight": [0, 4, 5, 12, 15, 16, 17, 18, 19, 20, 21]
    },
    14: {
      "left": [],
      "right": [104],
      "straight": [110, 111, 15]
    },
    15: {
      "left": [16, 17, 18, 19, 20],
      "right": [21, 5, 4, 13],
      "straight": [110, 111, 14, 104]
    },
    16: {
      "left": [17, 18, 19, 20],
      "right": [21, 5, 4, 13, 15],
      "straight": []
    },
    17: {
      "left": [18, 19, 20],
      "right": [21, 5, 4, 13, 15, 16],
      "straight": [110, 111, 14, 104]
    },
    18: {
      "left": [19, 20],
      "right": [21, 5, 4, 13, 15, 16, 17],
      "straight": []
    },
    19: {
      "left": [20],
      "right": [21, 5, 4, 13, 15, 16, 17, 18],
      "straight": [107]
    },
    20: {
      "left": [],
      "right": [21, 5, 4, 13, 15, 16, 17, 18, 19],
      "straight": []
    },
    21: {
      "left": [15, 16, 17, 18, 19, 20],
      "right": [
        21,
        5,
        4,
        13,
      ],
      "straight": []
    },
    100: {
      "left": [],
      "right": [],
      "straight": [11, 12, 101]
    },
    101: {
      "left": [100, 0, 2],
      "right": [101, 102, 103, 104, 105, 106, 107, 108, 109],
      "straight": []
    },
    102: {
      "left": [100, 0, 2, 101],
      "right": [103, 104, 105, 106, 107, 108, 109],
      "straight": []
    },
    103: {
      "left": [100, 0, 2, 101, 100, 102],
      "right": [104, 105, 106, 107, 108, 109],
      "straight": []
    },
    104: {
      "left": [100, 0, 2, 101, 100, 102, 103],
      "right": [105, 106, 107, 108, 109],
      "straight": [14, 110, 111, 15]
    },
    105: {
      "left": [100, 0, 2, 101, 100, 102, 103, 104],
      "right": [106, 107, 108, 109],
      "straight": []
    },
    106: {
      "left": [100, 0, 2, 101, 100, 102, 103, 104, 105],
      "right": [107, 108, 109],
      "straight": []
    },
    107: {
      "left": [100, 0, 2, 101, 100, 102, 103, 104, 105, 106],
      "right": [108, 109],
      "straight": [19]
    },
    108: {
      "left": [100, 0, 2, 101, 100, 102, 103, 104, 105, 106, 107],
      "right": [109],
      "straight": []
    },
    109: {
      "left": [100, 0, 2, 101, 100, 102, 103, 104, 105, 106, 107, 108],
      "right": [],
      "straight": []
    },
    110: {
      "left": [111, 15],
      "right": [14, 104],
      "straight": []
    },
    111: {
      "left": [15],
      "right": [14, 104, 110],
      "straight": []
    },
  };

  //Cây nhị phân
  final Map _graph = {
    0: {1: 130, 2: 70, 12: 55, 13: 180, 101: 200},
    1: {0: 130},
    2: {0: 70},
    3: {},
    4: {5: 120},
    5: {13: 180, 4: 120, 21: 150},
    10: {},
    11: {12: 112, 100: 45},
    12: {0: 55, 11: 112},
    13: {0: 180, 5: 180},
    14: {104: 30, 110: 62},
    15: {111: 50, 16: 62, 21: 62},
    16: {15: 62, 17: 62},
    17: {16: 62, 18: 62},
    18: {17: 62, 19: 62},
    19: {18: 62, 20: 62},
    20: {19: 62},
    21: {15: 62, 5: 150},
    100: {11: 45, 101: 41},
    101: {0: 200, 100: 41, 102: 62},
    102: {101: 62, 103: 62},
    103: {102: 62, 104: 62},
    104: {103: 62, 105: 62, 14: 30},
    105: {104: 62, 106: 62},
    106: {105: 62, 107: 62},
    107: {106: 62, 108: 62, 19: 170},
    108: {107: 62, 109: 62},
    109: {108: 62},
    110: {14: 62, 111: 62},
    111: {110: 62, 15: 50},
  };

  final Map _offset = {
    0: {"x": 235.7, "y": 618.2},
    1: {"x": 235.7, "y": 618.2},
    2: {"x": 235.7, "y": 618.2},
    3: {"x": 235.7, "y": 618.2},
    4: {"x": 235.7, "y": 618.2},
    5: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 18},
    10: {"x": 235.7, "y": 618.2},
    11: {"x": 235.7 + 6.38 * 5.5, "y": 618.2 - 6.2 * 11.2},
    12: {"x": 235.7 + 6.38 * 5.5, "y": 618.2},
    13: {"x": 235.7 - 6.38 * 18, "y": 618.2},
    14: {"x": 235.7 - 6.38 * 3, "y": 618.2 - 6.2 * 38.6},
    15: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 38.6},
    16: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 45.4},
    17: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 51.6},
    18: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 57.8},
    19: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 64},
    20: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 70.2},
    21: {"x": 235.7 - 6.38 * 18, "y": 618.2 - 6.2 * 33},
    100: {"x": 235.7 + 6.38 * 5.5, "y": 618.2 - 6.2 * 15.7},
    101: {"x": 235.7, "y": 618.2 - 6.2 * 20.0},
    102: {"x": 235.7, "y": 618.2 - 6.2 * 26.2},
    103: {"x": 235.7, "y": 618.2 - 6.2 * 32.4},
    104: {"x": 235.7, "y": 618.2 - 6.2 * 38.6},
    105: {"x": 235.7, "y": 618.2 - 6.2 * 44.8},
    106: {"x": 235.7, "y": 618.2 - 6.2 * 51.0},
    107: {"x": 235.7, "y": 618.2 - 6.2 * 57.2},
    108: {"x": 235.7, "y": 618.2 - 6.2 * 63.4},
    109: {"x": 235.7, "y": 618.2 - 6.2 * 69.6},
    110: {"x": 235.7 - 6.38 * 9.2, "y": 618.2 - 6.2 * 38.6},
    111: {"x": 235.7 - 6.38 * 15.4, "y": 618.2 - 6.2 * 38.6},
  };

  Map get map {
    return _map;
  }

  Map get offset {
    return _offset;
  }

  Map get graph {
    return _graph;
  }

  List<dynamic> toRoom({required int to, int from = 0}) {
    var dijkstra = Dijkstra.findPathFromGraph(_graph, from, to);
    return dijkstra;
  }

  int nameToCode(String title) {
    if (title.toLowerCase().startsWith("phong")) {
      return int.parse(title.substring(title.indexOf(' ') + 1));
    } else {
      switch (title.toLowerCase()) {
        case "bo mon cong nghe thong tin":
          return 20;
        case "bo mon tin hoc ung dung":
          return 19;
        case "bo mon mang may tinh va truyen thong":
          return 18;
        case "bo mon khoa hoc may tinh":
          return 17;
        case "bo mon cong nghe phan mem":
          return 16;
        case "bo mon he thong thong tin":
          return 15;
        case "phong ky thuat":
          return 21;
        case "nha ve sinh":
          return 5;
        case "khong gian sang che":
          return 13;
        case "trung tam tin hoc":
          return 14;
        case "van phong khoa":
          return 12;
        case "thu vien":
          return 11;
        case "van phong doan":
          return 100;
        case "sanh khoa":
          return 0;
        default:
          return int.parse(title.substring(title.indexOf(' ') + 1));
      }
    }
  }

  String? codetoName(int code) {
    switch (code) {
      case 20:
        return "BM CNTT";
      case 19:
        return "BM THUD";
      case 18:
        return "BM MMT&TT";
      case 17:
        return "BM KHMT";
      case 16:
        return "BM CNPM";
      case 15:
        return "BM HTTT";
      case 21:
        return "PKT";
      case 5:
        return "WC";
      case 13:
        return "KG Sáng chế";
      case 14:
        return "TT Tin học";
      case 12:
        return "VPK";
      case 11:
        return "Thư viện";
      case 100:
        return "VPD";
      case 0:
        return "Sảnh";
      default:
    }
  }

  List<dynamic> searchRoom({String from = "0", required String to}) {
    to = TiengViet.parse(to);
    from = TiengViet.parse(from);
    return toRoom(from: nameToCode(from), to: nameToCode(to));
  }

  bool checkLeft(int start, int room) {
    for (int e in _map[start]["left"]) {
      if (e == room) {
        return true;
      }
    }
    return false;
  }

  bool checkRight(int start, int room) {
    for (int e in _map[start]["right"]) {
      if (e == room) {
        return true;
      }
    }
    return false;
  }

  bool checkStraight(int start, int room) {
    for (int e in _map[start]["straight"]) {
      if (e == room) {
        return true;
      }
    }
    return false;
  }

  int distance(List arr) {
    int sum = 0;
    for (var i = 0; i < arr.length - 1; i++) {
      sum += _graph[arr[i]][arr[i + 1]] as int;
    }
    return sum;
  }

  List? route(int start, int room, List arr, List crr) {
    List path = [];
    try {
      if (checkLeft(start, room)) {
        path.add({
          "title":
              "Từ ${start < 100 ? codetoName(start) : "phòng $start"} quẹo trái ${distance(arr) / 10}m đến ${room < 100 ? codetoName(room) : "phòng $room"}",
          "icon": Typicons.arrow_left_outline,
        });
        if (crr.isNotEmpty) {
          crr.insert(0, room);
          route(crr.first, crr.last, crr, [])?.forEach((e) => path.add(e));
        }
        return path;
      } else if (checkRight(start, room)) {
        path.add({
          "title":
              "Từ ${start < 100 ? codetoName(start) : "phòng $start"} quẹo phải ${distance(arr) / 10}m đến ${room < 100 ? codetoName(room) : "phòng $room"}",
          "icon": Typicons.arrow_right_outline,
        });
        if (crr.isNotEmpty) {
          crr.insert(0, room);
          route(crr.first, crr.last, crr, [])?.forEach((e) => path.add(e));
        }
        return path;
      } else if (checkStraight(start, room)) {
        path.add({
          "title":
              "Từ ${start < 100 ? codetoName(start) : "phòng $start"} đi thẳng ${distance(arr) / 10}m đến ${room < 100 ? codetoName(room) : "phòng $room"}",
          "icon": Typicons.arrow_up_outline,
        });
        if (crr.isNotEmpty) {
          crr.insert(0, room);
          route(crr.first, crr.last, crr, [])?.forEach((e) => path.add(e));
        }
        return path;
      } else {
        crr.insert(0, arr.last);
        arr.removeLast();
        return route(arr.first, arr.last, arr, crr);
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

void main(List<String> args) {
  print(ManagerRoom()._map[0]["left"] == 13);
  List arr = ManagerRoom().searchRoom(from: "5", to: "20");

  print(arr);
  for (var i = 0; i < arr.length - 1; i++) {
    print(
        "${arr[i]} - ${arr[i + 1]} : ${ManagerRoom()._graph[arr[i]][arr[i + 1]]}");
  }
  print(ManagerRoom().route(arr.first, arr.last, arr, []));
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
//     201: {},
//     202: {},
//     203: {},
//     204: {},
//     205: {},
//     206: {},
//     207: {},
//     208: {},
//     209: {},
//     210: {},
//     211: {},
//     212: {},
//     213: {},
//     214: {},
//     215: {},
//     216: {},
//     217: {},
//     218: {},
//     219: {},
//     220: {},
//     221: {},
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
// BM HTTT: 15
// BM CNPM: 16
// BM KHMT: 17
// BM MMT&TT: 18
// BM THUD: 19
// BM CNTT: 20
// PKT: 21
