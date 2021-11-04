class SmartHouse {
  final String tempIn;
  final String humIn;
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
      : tempIn = json['temperature'],
        humIn = json['humidity'],
        isHouseDoorOpen = json['door'],
        isBeadRoomWindowOpen = json['window'],
        isLightHousOn = json['light']
      ;

  Map<String, dynamic> toJson() => {
    'isHouseDoorOpen': isHouseDoorOpen,
    'isBeadRoomWindowOpen': isBeadRoomWindowOpen,
    'isLightHousOn': isLightHousOn,
      };
}
