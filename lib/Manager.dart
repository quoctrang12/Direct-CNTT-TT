import 'package:dijkstra/dijkstra.dart';
import 'package:flutter/widgets.dart';
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
    0: {1: 130, 2: 70, 12: 55, 13: 180, 30: 140, 31: 222},
    1: {0: 130, 13: 60, 49: 80, 61: 62, 62: 70, 64: 50, 50: 140},
    2: {0: 70, 12: 70, 50: 70, 52: 20, 60: 50},
    3: {37: 40},
    4: {34: 30, 47: 40},
    5: {31: 62, 34: 93, 47: 80, 48: 70},
    11: {12: 93, 35: 45},
    12: {0: 55, 2: 70, 11: 112},
    13: {0: 180, 1: 60, 31: 110},
    14: {32: 20, 110: 62},
    15: {111: 70, 16: 62, 33: 30},
    16: {15: 62, 17: 62},
    17: {16: 62, 18: 62},
    18: {17: 62, 19: 62},
    19: {18: 62, 20: 62, 107: 170},
    20: {19: 62},
    21: {33: 40, 34: 62},
    30: {0: 140, 31: 172, 100: 40, 101: 62},
    31: {5: 62, 13: 110, 30: 172, 0: 222},
    32: {14: 20, 103: 50, 104: 12},
    33: {15: 30, 21: 40, 111: 42},
    34: {4: 30, 5: 93, 21: 62},
    35: {11: 45, 36: 80, 100: 20},
    36: {35: 80, 37: 296},
    37: {3: 40, 36: 296},
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
    111: {110: 62, 15: 70, 33: 42},
    40: {41: 70, 201: 70, 52: 70},
    41: {42: 180, 40: 70},
    42: {202: 40, 41: 180, 43: 140, 51: 180, 208: 240, 206: 200, 44: 260},
    43: {210: 50, 203: 70, 202: 120, 42: 140},
    44: {208: 40, 209: 160, 42: 260},
    45: {213: 122, 46: 70, 212: 40, 47: 80},
    46: {45: 70, 217: 20, 218: 62},
    47: {45: 80, 4: 40, 5: 80},
    48: {201: 200, 63: 50, 5: 70},
    49: {63: 50, 62: 20, 61: 60, 1: 80, 64: 20},
    50: {1: 140, 2: 70, 60: 40, 52: 60},
    51: {206: 30, 204: 40, 202: 160, 42: 180},
    52: {2: 20, 40: 70, 60: 40, 50: 60},
    60: {52: 40, 50: 40, 2: 50},
    61: {62: 50, 49: 60, 1: 62, 64: 70},
    62: {49: 20, 61: 50, 1: 70},
    63: {48: 50, 49: 50},
    64: {49: 20, 1: 50, 61: 70},
    201: {40: 70, 48: 200},
    202: {42: 40, 43: 120, 203: 62, 51: 160, 206: 190, 208: 220},
    203: {202: 62, 43: 70, 208: 190, 206: 230},
    204: {202: 200, 51: 40, 205: 124},
    205: {204: 124, 207: 20},
    206: {202: 190, 203: 220, 208: 62, 51: 30, 42: 200},
    207: {205: 20},
    208: {203: 190, 202: 220, 44: 40, 206: 62, 42: 240},
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
    1: {"x": 235.7 - 6.38 * 12, "y": 608.2 + 6.2 * 2},
    2: {"x": 235.7 + 6.38 * 4, "y": 608.2 - 6.2 * 6},
    3: {"x": 235.7 + 6.38 * 18, "y": 608.2 - 6.2 * 42.2},
    4: {"x": 235.7 - 6.38 * 23, "y": 608.2 - 6.2 * 27},
    5: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 18},
    10: {"x": 235.7, "y": 608.2},
    11: {"x": 235.7 + 6.38 * 5.5, "y": 608.2 - 6.2 * 11.2},
    12: {"x": 235.7 + 6.38 * 5.5, "y": 608.2},
    13: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 2},
    14: {"x": 235.7 - 6.38 * 3, "y": 608.2 - 6.2 * 37.5},
    15: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 38.6},
    16: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 45.4},
    17: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 51.6},
    18: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 57.8},
    19: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 64},
    20: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 70.2},
    21: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 33},
    30: {"x": 235.7, "y": 608.2 - 6.2 * 13},
    31: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 13},
    32: {"x": 235.7, "y": 608.2 - 6.2 * 37.5},
    33: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 37.5},
    34: {"x": 235.7 - 6.38 * 18, "y": 608.2 - 6.2 * 27},
    35: {"x": 235.7 + 6.38 * 5.5, "y": 608.2 - 6.2 * 13},
    36: {"x": 235.7 + 6.38 * 14, "y": 608.2 - 6.2 * 13},
    37: {"x": 235.7 + 6.38 * 14, "y": 608.2 - 6.2 * 42.2},
    100: {"x": 235.7 + 6.38 * 4.5, "y": 608.2 - 6.2 * 13},
    101: {"x": 235.7, "y": 608.2 - 6.2 * 21.0},
    102: {"x": 235.7, "y": 608.2 - 6.2 * 27.2},
    103: {"x": 235.7, "y": 608.2 - 6.2 * 33.4},
    104: {"x": 235.7, "y": 608.2 - 6.2 * 39.6},
    105: {"x": 235.7, "y": 608.2 - 6.2 * 45.8},
    106: {"x": 235.7, "y": 608.2 - 6.2 * 52.0},
    107: {"x": 235.7, "y": 608.2 - 6.2 * 58.2},
    108: {"x": 235.7, "y": 608.2 - 6.2 * 64.4},
    109: {"x": 235.7, "y": 608.2 - 6.2 * 70.6},
    110: {"x": 235.7 - 6.38 * 8, "y": 608.2 - 6.2 * 37.5},
    111: {"x": 235.7 - 6.38 * 14, "y": 608.2 - 6.2 * 37.5},
  };
  final Map _offset_2 = {
    1: {"x": 235.7 - 6.38 * 12, "y": 100.2 + 7 * 75},
    2: {"x": 235.7 + 6.38 * 4, "y": 100.2 + 7 * 68},
    3: {"x": 235.7 + 6.38 * 18, "y": 608.2 - 6.2 * 42.2},
    4: {"x": 235.7 - 6.38 * 23, "y": 608.2 - 6.2 * 27},
    5: {"x": 235.7 - 6.38 * 17.8, "y": 608.2 - 6.2 * 18},
    40: {"x": 123.0 + 6.38 * 25.3, "y": 100.2 + 7 * 61.5},
    41: {"x": 123.0 + 6.38 * 33.5, "y": 100.2 + 7 * 61.5},
    42: {"x": 123.0 + 6.38 * 33.5, "y": 100.2 + 7 * 44.5},
    43: {"x": 123.0 + 6.38 * 20, "y": 100.2 + 7 * 39},
    44: {"x": 123.0 + 6.38 * 19, "y": 100.2 + 7 * 29.7},
    45: {"x": 123.0, "y": 100.2 + 7 * 39.2},
    46: {"x": 123.0 - 6.38 * 9, "y": 100.2 + 7 * 39.2},
    47: {"x": 123.0, "y": 100.2 + 7 * 48.6},
    48: {"x": 123.0, "y": 100.2 + 7 * 61.5},
    49: {"x": 123.0, "y": 100.2 + 7 * 69.5},
    50: {"x": 123.0 + 6.38 * 22.3, "y": 100.2 + 7 * 74.8},
    51: {"x": 123.0 + 6.38 * 33.8, "y": 100.2 + 7 * 29.7},
    52: {"x": 123.0 + 6.38 * 25.3, "y": 100.2 + 7 * 68},
    60: {"x": 123.0 + 6.38 * 25.3, "y": 100.2 + 7 * 72.5},
    61: {"x": 123.0 + 6.38 * 7.2, "y": 100.2 + 7 * 71.5},
    62: {"x": 123.0 + 6.38 * 4, "y": 100.2 + 7 * 69.5},
    63: {"x": 123.0, "y": 100.2 + 7 * 65.5},
    64: {"x": 123.0, "y": 100.2 + 7 * 72},
    100: {"x": 235.7 + 6.38 * 4.5, "y": 608.2 - 6.2 * 13},
    201: {"x": 123.0 + 6.38 * 17.3, "y": 100.2 + 7 * 61.5},
    202: {"x": 123.0 + 6.38 * 29.2, "y": 100.2 + 7 * 44.5},
    203: {"x": 123.0 + 6.38 * 23, "y": 100.2 + 7 * 44.5},
    204: {"x": 123.0 + 6.38 * 33.8, "y": 100.2 + 7 * 25.7},
    205: {"x": 123.0 + 6.38 * 33.8, "y": 100.2 + 7 * 13.7},
    206: {"x": 123.0 + 6.38 * 29.2, "y": 100.2 + 7 * 29.7},
    207: {"x": 123.0 + 6.38 * 33.8, "y": 100.2 + 7 * 13.7},
    208: {"x": 123.0 + 6.38 * 23, "y": 100.2 + 7 * 29.7},
    209: {"x": 123.0 + 6.38 * 19, "y": 100.2 + 7 * 14},
    210: {"x": 123.0 + 6.38 * 17, "y": 100.2 + 7 * 39},
    211: {"x": 123.0 + 6.38 * 10.8, "y": 100.2 + 7 * 39.2},
    212: {"x": 123.0 + 6.38 * 4.6, "y": 100.2 + 7 * 39.2},
    213: {"x": 123.0, "y": 100.2 + 7 * 27},
    214: {"x": 123.0, "y": 100.2 + 7 * 15.6},
    215: {"x": 123.0, "y": 100.2 + 7 * 9.4},
    216: {"x": 123.0, "y": 100.2 + 7 * 3.2},
    217: {"x": 123.0 - 6.38 * 9.2, "y": 100.2 + 7 * 37.2},
    218: {"x": 123.0 - 6.38 * 9.2, "y": 100.2 + 7 * 31},
    219: {"x": 123.0 - 6.38 * 9.2, "y": 100.2 + 7 * 26},
    220: {"x": 123.0 - 6.38 * 9.2, "y": 100.2 + 7 * 21},
    221: {"x": 123.0 - 6.38 * 9.2, "y": 100.2 + 7 * 18},
  };

  Map get map {
    return _map;
  }

  Map get offset_1 {
    return _offset_1;
  }

  Map get offset_2 {
    return _offset_2;
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
        case "hoi truong khoa":
          return 10;
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
      case 10:
        return "Hội trường khoa";
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
