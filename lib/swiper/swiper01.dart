import 'package:flutter/material.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';

class Swiper01 extends StatefulWidget {
  @override
  _Swiper01State createState() => _Swiper01State();
}

class _Swiper01State extends State<Swiper01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DotPaginationSwiper(
        children: <Widget>[
          Center(child: Text('Page 1')),
          Center(child: Text('Page 2')),
          Center(child: Text('Page 3')),
          Center(child: Text('Page 4')),
          Center(child: Text('Page 5')),
        ],
      ),
    );
  }
}
