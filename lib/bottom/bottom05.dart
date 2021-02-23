import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_action_bar/navigation_action_bar.dart';
import 'package:flutter_demos/component/application.dart';

class BottomNavigartor05 extends StatefulWidget {
  @override
  _BottomNavigartor05State createState() => _BottomNavigartor05State();
}

class _BottomNavigartor05State extends State<BottomNavigartor05> {
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Application().getPageAppBar("BubbledNavigationBar", context),
        body: Text(""),
        bottomNavigationBar: NavigationActionBar(
            context: context,
            scaffoldColor: Colors.blueAccent,
            index: 0,
            subItems: [
              NavBarItem(iconData: Icons.attach_file, size: 25),
              NavBarItem(iconData: Icons.photo, size: 25),
              NavBarItem(iconData: Icons.camera_alt, size: 25),
            ],
            mainIndex: 2,
            items: [
              NavBarItem(iconData: Icons.list, size: 30),
              NavBarItem(iconData: Icons.compare_arrows, size: 30),
              NavBarItem(iconData: Icons.add, size: 40),
              NavBarItem(iconData: Icons.call_merge, size: 30),
              NavBarItem(iconData: Icons.person, size: 30),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            }));
  }
}
