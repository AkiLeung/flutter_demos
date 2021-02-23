import 'package:flutter/material.dart';
import 'package:fule_swiper/fule_swiper.dart';

class Swiper02 extends StatefulWidget {
  @override
  _Swiper02State createState() => _Swiper02State();
}

class _Swiper02State extends State<Swiper02> {
  List images = [
    {"src": "assets/images/swiper/pic001.jpg", "desc": "小船在水上"},
    {"src": "assets/images/swiper/pic002.jpg", "desc": "冰雪覆盖"},
    {"src": "assets/images/swiper/pic003.jpg", "desc": "绿色中的棕房子"},
  ];

  List<Widget> getImages() {
    List<Widget> _list = List();
    images.forEach((_item) {
      _list.add(Stack(
        children: <Widget>[
          Image.asset(
            _item['src'],
            fit: BoxFit.fitHeight,
            width: 750,
            height: 1334,
          ),
          Align(
            alignment: Alignment(-0.9, 0.3),
            child: Text(
              _item['desc'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
            ),
          )
        ],
      ));
    });
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Swiper(
          width: 750,
          height: 1334,
          autoplay: true,
          duration: 500,
          interval: 2000,
          indicatorActiveColor: Colors.white,
          indicatorColor: Colors.white38,
          indicatorRadius: 4,
          indicatorSpacing: 16,
          indicatorAlignment: Alignment(0, 0.95),
          children: getImages(),
        ),
      ),
    );
  }
}
