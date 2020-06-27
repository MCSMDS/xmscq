import 'dart:math';

random(int min, int max) => new Random().nextInt(max - min + 1) + min;

Future<String> generate(prefs) async {
  String gets(String x) => prefs.getString(x) ?? '';
  bool getb(String x) => prefs.getBool(x) ?? false;
  double getd(String x) => prefs.getDouble(x) ?? 1;

  List<String> posts = [
    gets("姿势1"),
    gets("姿势2"),
    gets("姿势3"),
    gets("姿势4"),
    gets("姿势5"),
    gets("姿势6"),
    gets("姿势7"),
    gets("姿势8")
  ];
  posts.removeWhere((element) => element == "");
  String post = posts[random(0, posts.length - 1)];

  List<String> tools = [
    gets("工具1"),
    gets("工具2"),
    gets("工具3"),
    gets("工具4"),
    gets("工具5"),
    gets("工具6")
  ];
  tools.removeWhere((element) => element == "");
  String tool = tools[random(0, tools.length - 1)];

  List<bool> mode = [
    getb("肛罚"),
    getb("手心"),
    getb("罚跪"),
  ];

  int i;
  switch (getd("次数").toInt()) {
    case 0:
      i = 10;
      break;
    case 1:
      i = random(10, 20);
      break;
    case 2:
      i = random(20, 30);
      break;
  }

  String ret = post +
      '姿势， 用' +
      tool +
      '打屁股' +
      i.toString() +
      '下' +
      prefs.getString("姿势2");

  var ii = random(1, 100);
  if (ii > 80 && mode[2]) {
    ret = '罚跪' + (i ~/ 10 + 8).toString() + '分钟， 其间乱动一次用' + tool + '打屁股1下';
  } else if (ii > 60 && ii <= 80 && mode[1]) {
    ret = post + '姿势， 用' + tool + '打手心' + i.toString() + '下';
  } else if (ii >= 50 && ii <= 60 && mode[0]) {
    ret = '开始罚肛，到' + (i ~/ 10 + 8).toString() + '分钟后结束';
  }

  return ret;
}
