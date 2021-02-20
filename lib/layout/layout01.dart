import 'package:flutter/material.dart';

class LayOut01 extends StatefulWidget {
  @override
  _LayOut01State createState() => _LayOut01State();
}

class _LayOut01State extends State<LayOut01> {
  //定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  //底部导航菜单-页面
  int _currentBottomIndex = 0;
  //底部导航菜单-标签
  final List<BottomNavigationBarItem> _bottomTabList =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: ('Home'),
        backgroundColor: Colors.orange),
    BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: ('Book'),
        backgroundColor: Colors.orange),
    BottomNavigationBarItem(
        icon: Icon(Icons.music_video),
        label: ('Music'),
        backgroundColor: Colors.orange),
    BottomNavigationBarItem(
        icon: Icon(Icons.movie),
        label: ('Movie'),
        backgroundColor: Colors.orange),
  ];

  final List<Widget> _bodyShowBottomTabs = [
    BottomTab01(),
    BottomTab02(),
    BottomTab03(),
    BottomTab04(),
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
          child: Icon(Icons.add), onPressed: () => print('悬浮按钮....')),
      //底部导航菜单
      bottomNavigationBar: _getApplicationBottomTabs,
    );
  }

  //创建程序AppBar
  getApplicationBar() => AppBar(
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
              icon: Icon(Icons.search),
              onPressed: () {
                print('search....');
              }),
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.settings),
              onPressed: () {
                print('settings ....');
                //通过GlobalKey来获取State对象
                _globalKey.currentState.openEndDrawer();
              }),
        ],
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
  get _getApplicationBottomTabs => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onBottomTabTapped,
        currentIndex: _currentBottomIndex,
        items: _bottomTabList,
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
