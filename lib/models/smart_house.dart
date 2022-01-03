class SmartHouse {
  final int tempIn;
  final int humIn;
  String isLightHousOn;
  String isHouseDoorOpen;
  String isBeadRoomWindowOpen;
  String isLightLivingRoom;



  SmartHouse({
    required this.tempIn,
    required this.humIn,
    required this.isHouseDoorOpen,
    required this.isBeadRoomWindowOpen,
    required this.isLightHousOn,
    required this.isLightLivingRoom,
  });

   SmartHouse.fromJson(Map<dynamic, dynamic> json)
      : tempIn = json['temperature'],
        humIn = json['humidity'],
        isHouseDoorOpen = json['DoorSwitch'],
        isBeadRoomWindowOpen = json['WindowSwitch'],
        isLightHousOn = json['LightSwitch'],
         isLightLivingRoom = json['LightSwitch']
      ;

  Map<String, dynamic> toJson() => {
    'isHouseDoorOpen': isHouseDoorOpen,
    'isBeadRoomWindowOpen': isBeadRoomWindowOpen,
    'isLightHousOn': isLightHousOn,
    'isLightLivingRoom': isLightLivingRoom,
      };
}
