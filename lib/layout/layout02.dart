import 'package:flutter/material.dart';

class LayOut02 extends StatefulWidget {
  @override
  _LayOut02State createState() => _LayOut02State();
}

class _LayOut02State extends State<LayOut02> {
  //定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  //底部导航菜单-页面
  int _currentBottomIndex = 0;
  final List<Widget> _bodyShowBottomTabs = [
    BottomTab01(),
    BottomTab02(),
    BottomTab03(),
    BottomTab04(),
    BottomTab05(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //设置key
      key: _globalKey,
      //抬头条目
      appBar: getApplicationBar(),
      //左侧滑动菜单
      drawer: getApplicationLeftMenu(),
      //右侧滑动菜单
      endDrawer: getApplicationRightMenu(),
      //数据体
      body: _bodyShowBottomTabs[_currentBottomIndex],
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        backgroundColor: _currentBottomIndex == 2 ? Colors.red : Colors.green,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.run_circle)]),
        onPressed: () {
          setState(() {
            _currentBottomIndex = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //底部导航菜单
      bottomNavigationBar: _getApplicationBottomTabs,
    );
  }

  // 返回每个隐藏的菜单项
  selectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        ));
  }

  //创建程序AppBar
  getApplicationBar() => PreferredSize(
        preferredSize: Size.fromHeight(45.0), // here the desired height
        child: AppBar(
            primary: true,
            textTheme: TextTheme(
              headline6: TextStyle(color: Colors.red, fontSize: 20),
            ),
            actionsIconTheme: IconThemeData(color: Colors.blue, opacity: 0.6),
            iconTheme: IconThemeData(color: Colors.black, opacity: 0.6),
            brightness: Brightness.dark,
            backgroundColor: Colors.white,
            shape: BeveledRectangleBorder(
                //设置appbar形状
                side: BorderSide(
                    color: Colors.black, width: 0, style: BorderStyle.solid)),
            //在leading为null的时候失效
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text("appTitle"),
            leading: Builder(
              builder: (context) => IconButton(
                icon: new Icon(Icons.dashboard),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: <Widget>[
              IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    _globalKey.currentState.openEndDrawer();
                  }),
              // 隐藏的菜单
              new PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  this.selectView(Icons.message, '发起群聊', 'A'),
                  this.selectView(Icons.group_add, '添加服务', 'B'),
                  this.selectView(Icons.cast_connected, '扫一扫码', 'C'),
                ],
                onSelected: (String action) {
                  // 点击选项的时候
                  switch (action) {
                    case 'A':
                      print("A");
                      break;
                    case 'B':
                      print("B");
                      break;
                    case 'C':
                      print("C");
                      break;
                  }
                },
              ),
            ]),
      );

//创建左侧导航功能
  getApplicationLeftMenu() => Drawer(
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("姓名:"),
              accountEmail: Text("Joseph@163.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/layout/touxiang.png"),
              ),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: AssetImage("assets/images/layout/pic1.png"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                Image.asset("assets/images/layout/pic2.png"),
                Image.asset("assets/images/layout/pic3.png"),
                Image.asset("assets/images/layout/pic4.png"),
              ],
            ),
            ListTile(
              title: Text("个人中心"),
              leading: CircleAvatar(child: Icon(Icons.people)),
              onTap: () => print("个人中心"),
            ),
            Divider(),
            ListTile(
              title: Text("系统设置"),
              leading: CircleAvatar(child: Icon(Icons.settings)),
              onTap: () => print("系统设置"),
            ),
            Divider(),
            ListTile(
              title: Text("注销登录"),
              leading: CircleAvatar(child: Icon(Icons.settings)),
              onTap: () => {
                print("注销登录"),
              },
            ),
          ],
        ),
      );

  //创建右侧导航功能
  getApplicationRightMenu() => Drawer(
        child: new ListView(
          children: <Widget>[
            ListTile(
              focusColor: Colors.amber,
              hoverColor: Colors.blue,
              title: Text("功能设置1"),
              leading: CircleAvatar(child: Icon(Icons.access_alarm)),
              onTap: () => print("功能设置1"),
            ),
            Divider(),
            ListTile(
              focusColor: Colors.amber,
              hoverColor: Colors.blue,
              title: Text("功能设置2"),
              leading: CircleAvatar(child: Icon(Icons.add)),
              onTap: () => print("功能设置2"),
            ),
            Divider(),
          ],
        ),
      );

//创建底部导航功能
  get _getApplicationBottomTabs => BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: _currentBottomIndex == 0 ? Colors.red : Colors.grey,
              onPressed: () {
                _onBottomTabTapped(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: _currentBottomIndex == 1 ? Colors.red : Colors.grey,
              onPressed: () {
                _onBottomTabTapped(1);
              },
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
              icon: Icon(Icons.photo_filter),
              color: _currentBottomIndex == 3 ? Colors.red : Colors.grey,
              onPressed: () {
                _onBottomTabTapped(3);
              },
            ),
            IconButton(
              icon: Icon(Icons.face),
              color: _currentBottomIndex == 4 ? Colors.red : Colors.grey,
              onPressed: () {
                _onBottomTabTapped(4);
              },
            ),
          ],
        ),
      );

  //点击激活对应的导航-底部
  void _onBottomTabTapped(int index) {
    setState(() {
      _currentBottomIndex = index;
    });
  }
}

class BottomTab01 extends StatefulWidget {
  @override
  _BottomTab01State createState() => _BottomTab01State();
}

class _BottomTab01State extends State<BottomTab01> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("BottomTab01"),
    );
  }
}

class BottomTab02 extends StatefulWidget {
  @override
  _BottomTab02State createState() => _BottomTab02State();
}

class _BottomTab02State extends State<BottomTab02> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("BottomTab02"),
    );
  }
}

class BottomTab03 extends StatefulWidget {
  @override
  _BottomTab03State createState() => _BottomTab03State();
}

class _BottomTab03State extends State<BottomTab03> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("BottomTab03"),
    );
  }
}

class BottomTab04 extends StatefulWidget {
  @override
  _BottomTab04State createState() => _BottomTab04State();
}

class _BottomTab04State extends State<BottomTab04> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("BottomTab04"),
    );
  }
}

class BottomTab05 extends StatefulWidget {
  @override
  _BottomTab05State createState() => _BottomTab05State();
}

class _BottomTab05State extends State<BottomTab05> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("BottomTab05"),
    );
  }
}
