import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:smarthouse/models/smart_house.dart';

SmartHouse initData = SmartHouse(
  tempIn: '28°C',
  //tempOut: '35°C',
  humIn: '47.4',
  isHouseDoorOpen: "doorClosed",
  isBeadRoomWindowOpen: "windowClosed",
  isLightHousOn: "lightOff",
  //humOut: '60.1',
  /*isLightHousOn: false,
  isLParkingLightOn: true,
  isParkingDoorOpen: false,
  isHouseDoorOpen: true,
  isBeadRoomWindowOpen: false,
  isLivingRoomOWindowOpen: true*/
);
Future<SmartHouse> getHouseData() async {
  /*SharedPreferences prefs = await SharedPreferences.getInstance();
  var houseData = prefs.getString('myHouse');*/
  String url = 'http://localhost:8080/Rest_smarthouse_war_exploded/api/devices';
  final response =
  await http.get(url, headers: {"Accept": "application/json"});

  /*if (houseData == null) {
    prefs.setString('myHouse', json.encode(initData.toJson()));
    return initData;
  } else {
    return SmartHouse.fromJson(json.decode(houseData));
  }
   */

  if (response.statusCode == 200) {
    return SmartHouse.fromJson(json.decode(response.body)[0]);

  } else {
    throw Exception('Failed to load post');
  }
}

Future updateSmartHouseData(SmartHouse smartHouse, String type) async {
  /*SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('myHouse', json.encode(smartHouse.toJson()));*/
  return http.put(
    Uri.parse('http://localhost:8080/Rest_smarthouse_war_exploded/api/devices/' + type),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(smartHouse.toJson()),
  );
}