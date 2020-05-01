import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  final String _titulo = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_titulo),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(),
          ],
        ),
      ),
    );
  }
}
