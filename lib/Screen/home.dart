import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_house/data/home_data.dart';
import 'package:smart_house/models/smart_house.dart';
import 'package:smart_house/widgets/drawer.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';


class Hoem extends StatefulWidget {
  Hoem({Key? key}) : super(key: key);

  @override
  State<Hoem> createState() => _HoemState();
}

class _HoemState extends State<Hoem> {
  late SmartHouse _smartHouse;
  late bool _isLLoadingData;
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;

  bool bedroomLamp = false;
  bool livingRoomLight = false;
  bool doorStatus = false;
  bool windowStatus = false;
  String _lastWords = '';

  @override
  initState() {
    const fiveSeconds = const Duration(seconds: 1);
    _isLLoadingData = true;
    Timer.periodic(fiveSeconds, (Timer t) =>    getHouseData().then((value) {
      setState(() {
        _smartHouse = value;
        _isLLoadingData = false;
        checkStatus();
      });
    }));
    super.initState();
    _initSpeech();

  }

void main(){
  checkStatus();
}
  void checkStatus(){
    if( _smartHouse.isHouseDoorOpen.toString()=="OPEN"){
      doorStatus=true;
    }
    if(_smartHouse.isLightHousOn.toString()=="LIGHT"){
      bedroomLamp=true;
    }
    if(_smartHouse.isBeadRoomWindowOpen.toString()=="open"){
      windowStatus=true;
    }
  }
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }



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
                    bedroomLamp ? 'images/lamp.png' : 'images/lamp_off.png',
                    'Bedroom Lights',
                    Switch(
                      value: bedroomLamp,
                      onChanged: (value) {
                        setState(() {
                          bedroomLamp = value;
                          if (bedroomLamp == true) {
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
                  buildRowData(
                    livingRoomLight ? 'images/lamp.png' : 'images/lamp_off.png',
                    'Living room Lights',
                    Switch(
                      value: livingRoomLight,
                      onChanged: (value) {
                        setState(() {
                          livingRoomLight = value;
                          if (livingRoomLight == true) {
                            _smartHouse.isLightLivingRoom = "LightOn";
                            updateSmartHouseData(
                                _smartHouse, "LightSwitch", "LIGHT");
                          } else {
                            _smartHouse.isLightLivingRoom = "LightOff";
                            updateSmartHouseData(
                                _smartHouse, "LightSwitch", "DARK");
                          }
                          //updateSmartHouseData(_smartHouse);
                        });
                      },
                    ),
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
                    doorStatus
                        ? 'images/open_door.png'
                        : 'images/close_door.png',
                    'Door',
                    Switch(
                      value: doorStatus,
                      onChanged: (value) {
                        setState(() {
                          doorStatus = value;
                          if (doorStatus == true) {
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
                    windowStatus
                        ? 'images/open_window.png'
                        : 'images/close_window.png',
                    'Window',
                    Switch(
                      value: windowStatus,
                      onChanged: (value) {
                        setState(() {
                          windowStatus = value;
                          if (windowStatus == true) {
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
