import 'package:flutter/material.dart';


class Hoem extends StatefulWidget {
  Hoem({Key? key}) : super(key: key);

  @override
  State<Hoem> createState() => _HoemState();
}

class _HoemState  extends State<Hoem> {

  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;

//  @override
  initState() {
    super.initState();
    //assert(_debugLifecycleState == _StateLifecycle.created);
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
    return Scaffold(
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
              child: const Text(
                "Environment",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildRowData('/Users/tekie/Desktop/smarthouse/images/tempin.png', 'Tempreture inside',
                const Text("28 °C")),
            const SizedBox(
              height: 10,
            ),
            buildRowData('/Users/tekie/Desktop/smarthouse/images/humdin.png', 'Humidity inside',
                Text("30 °C")),
            const SizedBox(
              height: 10,
            ),
            buildRowData('/Users/tekie/Desktop/smarthouse/images/tempout.png', 'Tempreture outside',
                Text("25 °C")),
            const SizedBox(
              height: 10,
            ),
            buildRowData('/Users/tekie/Desktop/smarthouse/images/humed_out.png', 'Humidity outside',
                Text("35 °C")),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              width: double.infinity,
              color: Colors.black12,
              child: const Text(
                "Lights",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildRowData(
              isSwitched
                ? '/Users/tekie/Desktop/smarthouse/images/lamp.png'
                : '/Users/tekie/Desktop/smarthouse/images/lamp_off.png',
              'Bedroom lights',
              Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                    //updateSmartHouseData(_smartHouse);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildRowData(
              isSwitched1
                  ? '/Users/tekie/Desktop/smarthouse/images/lamp.png'
                  : '/Users/tekie/Desktop/smarthouse/images/lamp_off.png',
              'Livingroom lights',
              Switch(
                value: isSwitched1,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched1 = value;
                    //updateSmartHouseData(_smartHouse);
                  });
                },
              ),),
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
                  ? '/Users/tekie/Desktop/smarthouse/images/open_park.png'
                  : '/Users/tekie/Desktop/smarthouse/images/close_park.png',
              'Parking door',
              Switch(
                value: isSwitched2,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched2 = value;
                    //updateSmartHouseData(_smartHouse);
                  });
                },
            ),),
            SizedBox(
              height: 10,
            ),
            buildRowData(
              isSwitched3
                  ? '/Users/tekie/Desktop/smarthouse/images/open_door.png'
                  : '/Users/tekie/Desktop/smarthouse/images/close_door.png',
              'House door',
              Switch(
                value: isSwitched3,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched3 = value;
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
                  ? '/Users/tekie/Desktop/smarthouse/images/open_window.png'
                  : '/Users/tekie/Desktop/smarthouse/images/close_window.png',
              'Bedroom window',
              Switch(
                value: isSwitched4,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched4 = value;
                    //updateSmartHouseData(_smartHouse);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildRowData(
              isSwitched5
                  ? '/Users/tekie/Desktop/smarthouse/images/open_window.png'
                  : '/Users/tekie/Desktop/smarthouse/images/close_window.png',
              'Bedroom window',
              Switch(
                value: isSwitched5,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched5 = value;
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