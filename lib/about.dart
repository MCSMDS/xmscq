import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "返回",
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(child: Text("内容", style: TextStyle(fontSize: 20))),
    );
  }
}
