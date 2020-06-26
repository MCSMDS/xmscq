import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _Setting createState() => new _Setting();
}

class _Setting extends State {
  SharedPreferences prefs;
  bool ganfa = false;
  bool shouxin = false;
  bool fagui = false;
  double sliderValue = 1;

  void sets(String x, String y) => prefs.setString(x, y);
  String gets(String x) => prefs.getString(x) ?? '';

  void setb(String x, bool y) => prefs.setBool(x, y);
  bool getb(String x) => prefs.getBool(x) ?? false;

  void setd(String x, double y) => prefs.setDouble(x, y);
  double getd(String x) => prefs.getDouble(x) ?? 1;

  Future init() async {}

  @override
  void initState() async {
    prefs = await SharedPreferences.getInstance();
    ganfa = getb("肛罚");
    shouxin = getb("手心");
    fagui = getb("罚跪");
    sliderValue = getd("次数");
    super.initState();
  }

  @override
  void dispose() {
    setb("肛罚", ganfa);
    setb("手心", shouxin);
    setb("罚跪", fagui);
    setd("次数", sliderValue);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scrollbar(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Column(children: <Widget>[
                CheckboxListTile(
                  value: true,
                  title: Text('打屁股'),
                  onChanged: (value) {},
                ),
                CheckboxListTile(
                  value: ganfa,
                  title: Text('肛罚'),
                  onChanged: (value) {
                    setState(() {
                      ganfa = value;
                    });
                  },
                ),
                CheckboxListTile(
                  value: shouxin,
                  title: Text('打手心'),
                  onChanged: (value) {
                    setState(() {
                      shouxin = value;
                    });
                  },
                ),
                CheckboxListTile(
                  value: fagui,
                  title: Text('罚跪'),
                  onChanged: (value) {
                    setState(() {
                      fagui = value;
                    });
                  },
                ),
                Slider(
                  value: sliderValue,
                  onChanged: (data) {
                    setState(() {
                      sliderValue = data;
                    });
                  },
                  min: 0,
                  max: 2,
                  divisions: 2,
                  label: '$sliderValue',
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势1"),
                  controller: TextEditingController(text: gets("姿势1")),
                  onChanged: (String value) => sets("姿势1", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势2"),
                  controller: TextEditingController(text: gets("姿势2")),
                  onChanged: (String value) => sets("姿势2", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势3"),
                  controller: TextEditingController(text: gets("姿势3")),
                  onChanged: (String value) => sets("姿势3", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势4"),
                  controller: TextEditingController(text: gets("姿势4")),
                  onChanged: (String value) => sets("姿势4", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势5"),
                  controller: TextEditingController(text: gets("姿势5")),
                  onChanged: (String value) => sets("姿势5", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势6"),
                  controller: TextEditingController(text: gets("姿势6")),
                  onChanged: (String value) => sets("姿势6", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势7"),
                  controller: TextEditingController(text: gets("姿势7")),
                  onChanged: (String value) => sets("姿势7", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "姿势8"),
                  controller: TextEditingController(text: gets("姿势8")),
                  onChanged: (String value) => sets("姿势8", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "工具1"),
                  controller: TextEditingController(text: gets("工具1")),
                  onChanged: (String value) => sets("工具1", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "工具2"),
                  controller: TextEditingController(text: gets("工具2")),
                  onChanged: (String value) => sets("工具2", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "工具3"),
                  controller: TextEditingController(text: gets("工具3")),
                  onChanged: (String value) => sets("工具3", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "工具4"),
                  controller: TextEditingController(text: gets("工具4")),
                  onChanged: (String value) => sets("工具4", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "工具5"),
                  controller: TextEditingController(text: gets("工具5")),
                  onChanged: (String value) => sets("工具5", value),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "工具6"),
                  controller: TextEditingController(text: gets("工具6")),
                  onChanged: (String value) => sets("工具6", value),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
