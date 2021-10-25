class _HoemState  extends State<Hoem> {
  //late SmartHouse _smartHouse;
  //late bool _isLLoadingData;

  bool isSwitched = false;

//  @override
  initState() {
    // _isLLoadingData = true;
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
            buildRowData('images/tempin.png', 'Tempreture inside',
                const Text("_28 °C")),
            const SizedBox(
              height: 10,
            ),
            buildRowData('images/humdin.png', 'Humidity inside',
                Text("30 °C")),
            const SizedBox(
              height: 10,
            ),
            buildRowData('images/tempout.png', 'Tempreture outside',
                Text("25 °C")),
            const SizedBox(
              height: 10,
            ),
            buildRowData('images/humed_out.png', 'Humidity outside',
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
            buildRowData('images/lamp_off.png', 'Bedroom lights',
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildRowData('images/lamp_off.png', 'Livingroom lights',
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
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
              'images/open_park.png', 'Parking door',
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildRowData(
              'images/open_door.png',
              'House Door',
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildRowData(
              'images/open_window.png',
              'Window bedroom',
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildRowData(
              'images/open_window.png',
              'Window living room',
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
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