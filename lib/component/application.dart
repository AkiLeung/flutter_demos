import 'package:flutter/material.dart';

class Application extends AppBar {
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
  getMainAppBar(String title, BuildContext context,
          GlobalKey<ScaffoldState> _globalKey) =>
      PreferredSize(
          child: AppBar(
            title: new Text(title),
            elevation: 0.0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: new Icon(Icons.dashboard),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            backgroundColor: Colors.red,
            centerTitle: true,
            actions: <Widget>[
              new IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    //通过GlobalKey来获取State对象
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
                      break;
                    case 'B':
                      break;
                    case 'C':
                      break;
                  }
                },
              ),
            ],
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07));

  //创建程序AppBar
  getHomeAppBar(String title, BuildContext context) => PreferredSize(
      child: AppBar(
        title: new Text(title),
        leading: Text(''),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
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
                  break;
                case 'B':
                  break;
                case 'C':
                  break;
              }
            },
          ),
        ],
      ),
      preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.07));

  //创建程序AppBar
  getPageAppBar(String title, BuildContext context) => PreferredSize(
      child: AppBar(
        title: new Text(title),
        leading: Builder(
          builder: (context) => IconButton(
              icon: new Icon(Icons.home),
              onPressed: () => {
                    //Scaffold.of(context).openDrawer(),
                    Navigator.pushNamed(context, "main"),
                  }),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          // 非隐藏的菜单
          new IconButton(
              icon: new Icon(Icons.arrow_back_rounded),
              tooltip: 'back',
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.07));

  //创建左侧导航功能
  getAppLeftMenu() => Drawer(
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("姓名:"),
              accountEmail: Text("Joseph@163.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/touxiang.png"),
              ),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: AssetImage("assets/images/pic1.png"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                Image.asset("assets/images/pic2.png"),
                Image.asset("assets/images/pic3.png"),
                Image.asset("assets/images/pic4.png"),
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
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return LoginPage();
                // }))
              },
            ),
          ],
        ),
      );

  //创建右侧导航功能
  getAppRightMenu() => Drawer(
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
}
