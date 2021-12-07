import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:smart_house/models/smart_house.dart';

SmartHouse initData = SmartHouse(
  tempIn: 28,
  //tempOut: '35°C',
  humIn: 47,
  isHouseDoorOpen: "doorClosed",
  isBeadRoomWindowOpen: "windowClosed",
  isLightHousOn: "lightOff",
  //humOut: '60.1',
);
Future<SmartHouse> getHouseData() async {
  String url =
      'http://192.168.1.126:7777/Rest_smarthouse_war_exploded/api/devices';
  final response =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return SmartHouse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

Future updateSmartHouseData(
    SmartHouse smartHouse, String type, String value) async {
  return http.put(
    Uri.parse(
        'http://192.168.1.126:7777/Rest_smarthouse_war_exploded/api/devices/device/' +
            type +
            "/" +
            value),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(smartHouse.toJson()),
  );
}
