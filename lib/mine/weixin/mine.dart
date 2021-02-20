import 'package:flutter/material.dart';
import 'package:flutter_demos/mine/weixin/mineRow.dart';

class WeiXinMinePage extends StatefulWidget {
  @override
  _WeiXinMinePageState createState() => _WeiXinMinePageState();
}

class _WeiXinMinePageState extends State<WeiXinMinePage> {
  double leftDistance = 50;

  Widget headerWidget() {
    return Container(
      color: Colors.white,
      height: 160,
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                //图片通过装饰器去设置圆角是不起作用的，应该设置在装饰器内的背景图
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(2.0), //设置圆角，image没有这个属性
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/mine/weixin/touxiang.png'),
                      fit: BoxFit.cover),
                ),
              ), //头像
              Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 5),
                width: MediaQuery.of(context).size.width - 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Joseph.Leung',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ), //昵称
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '账号:#JosephLeung#',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Image(
                          image:
                              AssetImage('assets/images/mine/weixin/right.png'),
                          width: 16,
                        )
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(220, 220, 220, 1),
            child: MediaQuery.removePadding(
                removeTop: true, //移除屏幕顶部刘海
                context: context,
                child: ListView(
                  children: <Widget>[
                    headerWidget(), //头部
                    SizedBox(
                      height: 10,
                    ),
                    PersonRow(
                      imageName: 'assets/images/mine/weixin/pay.png',
                      title: '支付',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PersonRow(
                      imageName: 'assets/images/mine/weixin/favorite.png',
                      title: '收藏',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: leftDistance,
                          color: Colors.white,
                          height: 0.5,
                        ),
                        Container(
                          height: 0.5,
                        )
                      ],
                    ),
                    PersonRow(
                      imageName: 'assets/images/mine/weixin/picture.png',
                      title: '相册',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: leftDistance,
                          color: Colors.white,
                          height: 0.5,
                        ),
                        Container(
                          height: 0.5,
                        )
                      ],
                    ),
                    PersonRow(
                      imageName: 'assets/images/mine/weixin/card.png',
                      title: '卡包',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: leftDistance,
                          color: Colors.white,
                          height: 0.5,
                        ),
                        Container(
                          height: 0.5,
                        )
                      ],
                    ),
                    PersonRow(
                      imageName: 'assets/images/mine/weixin/emoji.png',
                      title: '表情',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PersonRow(
                      imageName: 'assets/images/mine/weixin/setting.png',
                      title: '设置',
                    ),
                  ],
                )),
          ), //列表
          Container(
            height: 25,
            color: Color.fromRGBO(0, 0, 0, 0),
            margin: EdgeInsets.only(top: 40, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image(image: AssetImage('assets/images/mine/weixin/photo.png'))
              ],
            ),
          ), //相机
        ],
      ),
    );
  }
}
