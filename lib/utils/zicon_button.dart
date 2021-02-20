import 'package:flutter/material.dart';
import 'package:flutter_demos/utils/zicon_data.dart';

// ignore: must_be_immutable
class ZIcon extends StatefulWidget {
  List<ZIconData> iconList;
  ZIcon({Key key, @required this.iconList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ZIconState();
}

class _ZIconState extends State<ZIcon> {
  @override
  Widget build(BuildContext context) {
    final zIcons = widget.iconList.map((zIcon) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 40,
              height: 40,
              child: IconButton(
                icon: Image.asset(zIcon.icon),
                onPressed: () {
                  Navigator.pushNamed(context, zIcon.router);
                },
              )),
          Container(
            height: 25,
            // margin: EdgeInsets.only(top: 5),
            child: Center(
              child: Text(
                zIcon.name,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      );
    });
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      alignment: Alignment.center,
      child: GridView.count(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 5,
        childAspectRatio: 1,
        padding: EdgeInsets.all(3),
        children: zIcons.toList(),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
