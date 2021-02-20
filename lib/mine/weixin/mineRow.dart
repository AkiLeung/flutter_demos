import 'package:flutter/material.dart';

class PersonRow extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final String subImagename;

  const PersonRow({
    Key key,
    @required this.title,
    @required this.imageName,
    this.subTitle,
    this.subImagename,
  })  : assert(title != null, 'title 不能为空'),
        assert(imageName != null, 'imageName 不能为空');

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PersonRowState();
  }
}

class PersonRowState extends State<PersonRow> {
  Color stateBackColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (BuildContext context) {
        //   return SubDiscover_Page(
        //     title: widget.title,
        //   );
        // }));
        setState(() {
          stateBackColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          stateBackColor = Colors.grey[100];
        });
      },
      onTapCancel: () {
        print('onTapCance----');
        setState(() {
          stateBackColor = Colors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: stateBackColor,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image(
                    width: 20, height: 20, image: AssetImage(widget.imageName)),
                SizedBox(
                  width: 15,
                ),
                Text(widget.title),
              ],
            ),
            Row(
              children: <Widget>[
                Text(widget.subTitle != null ? widget.subTitle : ''),
                SizedBox(
                  width: 15,
                ),
                widget.subImagename != null
                    ? Image(width: 15, image: AssetImage(widget.subImagename))
                    : Container(),
                SizedBox(width: 15),
                Image(
                    width: 20,
                    image: AssetImage('assets/images/mine/weixin/right.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
