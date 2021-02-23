import 'package:flutter/material.dart';

class Splash01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Icon(
          Icons.access_alarms,
          size: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}
