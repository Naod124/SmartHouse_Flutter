class SmartHouse {
  final int tempIn;
  final int humIn;
  dynamic isLightHousOn;
  dynamic isHouseDoorOpen;
  dynamic isBeadRoomWindowOpen;
  dynamic isLightLivingRoom;




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
        isHouseDoorOpen = json['doors'],
        isBeadRoomWindowOpen = json['windows'],
        isLightHousOn = json['lights'],
         isLightLivingRoom = json['lights']
      ;

  Map<dynamic, dynamic> toJson() => {
    'doors': isHouseDoorOpen,
    'windows': isBeadRoomWindowOpen,
    'lights': isLightHousOn,
    'lights': isLightLivingRoom,
      };
}
