import 'package:flutter/material.dart';
import 'package:flutter_demos/component/application.dart';

class ListView01 extends StatefulWidget {
  @override
  _ListView01State createState() => _ListView01State();
}

class _ListView01State extends State<ListView01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Application().getPageAppBar("ListView", context),
      body: ListView(children: _getListData()),
    );
  }

  //获取ListView中要展示的widget
  _getListData() {
    //存储widget的List
    List<Widget> widgets = [];
    for (int i = 1; i <= 20; i++) {
      //添加要展示的item内容
      widgets.add(
        //可以设置padding值的widget
        new Padding(
          padding: new EdgeInsets.all(0.0),
          //CardItem是一个自定义控件，主要是以卡片的形式展示item内容
          child: new _CardItem(
            color: Colors.deepOrangeAccent,
            child: _getChild(i),
          ),
        ),
      );
      //为item之间添加空隙
      widgets.add(
        new Container(
          width: 0.0,
          height: 0.0,
          color: Colors.white,
        ),
      );
    }
    return widgets;
  }

  _getChild(int i) {
    //可以设置padding值的控件
    return new Padding(
        padding: new EdgeInsets.all(30.0),
        //竖直容器，相当于竖直的LinearLayout
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          //子View
          children: <Widget>[
            //水平容器，相当于水平的LinearLayout
            new Row(
              //子View
              children: <Widget>[
                //添加图片
                //new Image(image:AssetImage('static/images/my_cat.png')),
                new Icon(Icons.add_to_queue_outlined),
                //表示当前控件所要占据的空间
                new Expanded(
                  child: new Text(
                    'cat',
                    textAlign: TextAlign.center,
                  ),
                  flex: 1,
                ),
                new Expanded(
                    child: new Text(
                      '$i 小时前',
                      textAlign: TextAlign.end,
                    ),
                    flex: 2),
                new FlatButton(
                  child: Icon(Icons.ac_unit),
                  onPressed: () => {print("$i 点击")},
                )
              ],
            ),
            //Text控件
            new Text(
              '这是一只猫，它的名字叫cat',
              textAlign: TextAlign.left,
            ),
          ],
        ));
  }
}

//继承自StatelessWidget
class _CardItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color color;
  final RoundedRectangleBorder shape;
  final double elevation;

  //构造函数
  _CardItem(
      {@required this.color,
      this.child,
      this.elevation = 2.0,
      this.shape,
      this.margin});

  //渲染内容
  @override
  Widget build(BuildContext context) {
    //cardView的margin值
    EdgeInsets margin = this.margin;
    //它是一个圆角矩形卡片，shape表示圆角大小
    RoundedRectangleBorder shape = this.shape;
    //颜色
    Color color = this.color;
    //初始化cardItem左右上下的margin值
    margin ??= EdgeInsets.only(left: 5.0, top: 2.0, right: 5.0, bottom: 3.0);
    //初始化圆角值
    shape ??= new RoundedRectangleBorder(
        borderRadius: new BorderRadius.all(Radius.circular(4.0)));
    color ??= new Color(0xffeeff);
    //返回card对象
    return new Card(
      elevation: elevation,
      shape: shape,
      color: color,
      margin: margin,
      child: child,
    );
  }
}
