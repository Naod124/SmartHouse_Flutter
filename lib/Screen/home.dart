import 'package:flutter/material.dart';
import 'package:smart_house/data/home_data.dart';
import 'package:smart_house/models/smart_house.dart';
import 'package:smart_house/widgets/drawer.dart';
import 'dart:async';


class Hoem extends StatefulWidget {
  Hoem({Key? key}) : super(key: key);

  @override
  State<Hoem> createState() => _HoemState();
}

class _HoemState extends State<Hoem> {
  late SmartHouse _smartHouse;
  late bool _isLLoadingData;

  @override
  initState() {
    const fiveSeconds = const Duration(seconds: 1);
    _isLLoadingData = true;
    Timer.periodic(fiveSeconds, (Timer t) =>    getHouseData().then((value) {
      setState(() {
        _smartHouse = value;
        _isLLoadingData = false;
      });
    }));

    /*getHouseData().then((value) {
      setState(() {
        _smartHouse = value;
        _isLLoadingData = false;
      });
    });

     */

    super.initState();
  }

  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;

  Widget buildRowData(String image, String title, Widget value) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 30,
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title),
        const Expanded(
          child: SizedBox(),
        ),
        value,
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLLoadingData
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            drawer: AppDrawer(),
            appBar: AppBar(
              title: Text('Smart House'),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    width: double.infinity,
                    color: Colors.black12,
                    child: Text(
                      "Environment",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildRowData('images/tempin.png', 'Temperature ',
                      Text(_smartHouse.tempIn.toString() + "°C")),
                  SizedBox(
                    height: 10,
                  ),
                  buildRowData('images/humdin.png', 'Humidity ',
                      Text(_smartHouse.humIn.toString() + "%")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    width: double.infinity,
                    color: Colors.black12,
                    child: Text(
                      "Lights",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildRowData(
                    isSwitched ? 'images/lamp.png' : 'images/lamp_off.png',
                    'Lights',
                    Switch(
                      value: isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched = value;
                          if (isSwitched == true) {
                            _smartHouse.isLightHousOn = "LightOn";
                            updateSmartHouseData(
                                _smartHouse, "LightSwitch", "LIGHT");
                          } else {
                            _smartHouse.isLightHousOn = "LightOff";
                            updateSmartHouseData(
                                _smartHouse, "LightSwitch", "DARK");
                          }
                          //updateSmartHouseData(_smartHouse);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    width: double.infinity,
                    color: Colors.black12,
                    child: Text(
                      "Windows and Doors",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildRowData(
                    isSwitched2
                        ? 'images/open_door.png'
                        : 'images/close_door.png',
                    'Door',
                    Switch(
                      value: isSwitched2,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched2 = value;
                          if (isSwitched2 == true) {
                            _smartHouse.isHouseDoorOpen = "DoorOpen";
                            updateSmartHouseData(
                                _smartHouse, "DoorSwitch", "OPEN");
                          } else {
                            _smartHouse.isHouseDoorOpen = "DoorClosed";
                            updateSmartHouseData(
                                _smartHouse, "DoorSwitch", "CLOSED");
                          }
                          //updateSmartHouseData(_smartHouse);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildRowData(
                    isSwitched4
                        ? 'images/open_window.png'
                        : 'images/close_window.png',
                    'Window',
                    Switch(
                      value: isSwitched4,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched4 = value;
                          if (isSwitched4 == true) {
                            _smartHouse.isBeadRoomWindowOpen = "WindowOpen";
                            updateSmartHouseData(
                                _smartHouse, "WindowSwitch", "open");
                          } else {
                            _smartHouse.isBeadRoomWindowOpen = "WindowClose";
                            updateSmartHouseData(
                                _smartHouse, "WindowSwitch", "shut");
                          }
                          //updateSmartHouseData(_smartHouse);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
  }
}
