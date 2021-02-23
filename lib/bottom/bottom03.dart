import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter_demos/component/application.dart';

class BottomNavigartor03 extends StatefulWidget {
  @override
  _BottomNavigartor03State createState() => _BottomNavigartor03State();
}

class _BottomNavigartor03State extends State<BottomNavigartor03> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Application().getPageAppBar("fancy_bottom", context),
      body: Text("$currentPage"),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.search, title: "Search"),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}
