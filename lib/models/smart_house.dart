class SmartHouse {
  final int tempIn;
  final int humIn;
  String isLightHousOn;
   String isHouseDoorOpen;
  String isBeadRoomWindowOpen;



  SmartHouse({
    required this.tempIn,
    required this.humIn,
    required this.isHouseDoorOpen,
    required this.isBeadRoomWindowOpen,
    required this.isLightHousOn,

  });

   SmartHouse.fromJson(Map<dynamic, dynamic> json)
      : tempIn = json['Temperature'],
        humIn = json['Humidity'],
        isHouseDoorOpen = json['DoorSwitch'],
        isBeadRoomWindowOpen = json['WindowSwitch'],
        isLightHousOn = json['LightSwitch']
      ;

  Map<String, dynamic> toJson() => {
    'isHouseDoorOpen': isHouseDoorOpen,
    'isBeadRoomWindowOpen': isBeadRoomWindowOpen,
    'isLightHousOn': isLightHousOn,
      };
}
