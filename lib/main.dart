import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setting.dart';
import 'about.dart';
import "api.dart";

void main() => runApp(MaterialApp(home: Main()));

enum Menu { setting, about }

class Main extends StatefulWidget {
  @override
  _Main createState() => new _Main();
}

class _Main extends State {
  String result = "请点击生成";
  SharedPreferences prefs;

  @override
  void initState() async {
    prefs = await SharedPreferences.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('实践项目生成器'),
        actions: <Widget>[
          PopupMenuButton<Menu>(
            tooltip: "选项",
            onSelected: (Menu result) {
              switch (result) {
                case Menu.setting:
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new Setting()),
                  );
                  break;
                case Menu.about:
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new About()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(value: Menu.setting, child: Text('设置')),
              const PopupMenuItem<Menu>(value: Menu.about, child: Text('关于')),
            ],
          )
        ],
      ),
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Center(child: Text("$result", style: TextStyle(fontSize: 20)));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updata();
        },
        child: Text('生成'),
      ),
    );
  }

  Future updata() async {
    String zheword = await generate(prefs);
    setState(() {
      result = zheword;
    });
  }
}
