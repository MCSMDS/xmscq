import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
      ),
      body: Center(child: Text("内容", style: TextStyle(fontSize: 20))),
    );
  }
}
