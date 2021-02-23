import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:flutter_demos/splash/splash01.dart';
import 'package:flutter_demos/utils/zicon_button.dart';
import 'package:flutter_demos/utils/zicon_data.dart';
import 'package:flutter_demos/layout/layout01.dart';
import 'package:flutter_demos/layout/layout02.dart';
import 'package:flutter_demos/listView/listView01.dart';
import 'package:flutter_demos/listView/listView02.dart';
import 'package:flutter_demos/listView/listView03.dart';
import 'package:flutter_demos/bottom/bottom01.dart';
import 'package:flutter_demos/bottom/bottom02.dart';
import 'package:flutter_demos/bottom/bottom03.dart';
import 'package:flutter_demos/bottom/bottom04.dart';
import 'package:flutter_demos/bottom/bottom05.dart';
import 'package:flutter_demos/swiper/swiper01.dart';
import 'package:flutter_demos/swiper/swiper02.dart';
import 'package:flutter_demos/home/jingdong/home.dart';
import 'package:flutter_demos/mine/weixin/mine.dart';

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: MyApp(), 2: MyApp()};

  runApp(MaterialApp(
    home: CustomSplash(
      imagePath: 'assets/images/splash/splash.png',
      backGroundColor: Colors.deepOrange,
      animationEffect: 'zoom-in',
      logoSize: 250,
      home: MyApp(),
      customFunction: duringSplash,
      duration: 3500,
      type: CustomSplashType.StaticDuration,
      outputAndHome: op,
    ),
  ));

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext, RouteSettings)> routes = {
    "main": (context, settings) => MyMainPage(title: 'Flutter Demos'),
    "layOut01": (context, settings) => LayOut01(),
    "layOut02": (context, settings) => LayOut02(),
    "listView01": (context, settings) => ListView01(),
    "listView02": (context, settings) => ListView02(),
    "listView03": (context, settings) => ListView03(),
    "bottomNavigator01": (context, settings) => BottomNavigartor01(),
    "bottomNavigator02": (context, settings) => BottomNavigartor02(),
    "bottomNavigator03": (context, settings) => BottomNavigartor03(),
    "bottomNavigator04": (context, settings) => BottomNavigartor04(),
    "bottomNavigator05": (context, settings) => BottomNavigartor05(),
    "swiper01": (context, settings) => Swiper01(),
    "swiper02": (context, settings) => Swiper02(),
    "jingDongHome": (context, settings) => JingDongHomePage(),
    "weiXinMine": (context, settings) => WeiXinMinePage(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash01());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'Flutter Demos',
            initialRoute: "main",
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: const Color.fromRGBO(239, 238, 239, 1.0),
              primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            //注册路由
            onGenerateRoute: _onGenerateRoute,
            home: MyMainPage(title: 'Flutter Demos'),
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) {
        String routeName = settings.name;
        if (routes[routeName] != null) {
          return routes[routeName](context, settings);
        }
        return null;
      },
    );
  }
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  List<ZIconData> layoutIconList = [];
  List<ZIconData> listViewIconList = [];
  List<ZIconData> bttmNavgIconList = [];
  List<ZIconData> swiperIconList = [];
  // List<ZIconData> rightMenuIconList = [];

  List<ZIconData> homePageIconList = [];
  List<ZIconData> minePageIconList = [];
  @override
  initState() {
    super.initState();
    initData();
  }

  initData() async {
    /*****************Layout*****************/
    layoutIconList.add(ZIconData(
        icon: "assets/images/icon/layout.png",
        name: "基础版",
        router: "layOut01"));
    layoutIconList.add(ZIconData(
        icon: "assets/images/icon/layout.png",
        name: "进一级",
        router: "layOut02"));
    /*****************list*****************/
    listViewIconList.add(ZIconData(
        icon: "assets/images/icon/list.png",
        name: "基础版",
        router: "listView01"));
    listViewIconList.add(ZIconData(
        icon: "assets/images/icon/list.png",
        name: "进一级",
        router: "listView02"));
    listViewIconList.add(ZIconData(
        icon: "assets/images/icon/list.png",
        name: "group_list",
        router: "listView03"));
    /*****************bttmNavgIconList*****************/
    bttmNavgIconList.add(ZIconData(
        icon: "assets/images/icon/bottom.png",
        name: "curved",
        router: "bottomNavigator01"));
    bttmNavgIconList.add(ZIconData(
        icon: "assets/images/icon/bottom.png",
        name: "ff",
        router: "bottomNavigator02"));
    bttmNavgIconList.add(ZIconData(
        icon: "assets/images/icon/bottom.png",
        name: "fancy",
        router: "bottomNavigator03"));
    bttmNavgIconList.add(ZIconData(
        icon: "assets/images/icon/bottom.png",
        name: "Bubbled",
        router: "bottomNavigator04"));
    bttmNavgIconList.add(ZIconData(
        icon: "assets/images/icon/bottom.png",
        name: "navigation",
        router: "bottomNavigator05"));

    /*****************swiperIconList*****************/
    swiperIconList.add(ZIconData(
        icon: "assets/images/icon/swiper.png",
        name: "pagination",
        router: "swiper01"));
    swiperIconList.add(ZIconData(
        icon: "assets/images/icon/swiper.png",
        name: "fule_swiper",
        router: "swiper02"));
    /*****************home page *****************/
    homePageIconList.add(ZIconData(
        icon: "assets/images/icon/jingdong.png",
        name: "京东版",
        router: "jingDongHome"));
    homePageIconList.add(ZIconData(
        icon: "assets/images/icon/setting.png",
        name: "test2",
        router: "listView02"));

    /*****************mine page *****************/
    minePageIconList.add(ZIconData(
        icon: "assets/images/icon/weixin.png",
        name: "微信版",
        router: "weiXinMine"));
    minePageIconList.add(ZIconData(
        icon: "assets/images/icon/setting.png",
        name: "test2",
        router: "listView02"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* ******************************************************************************************* */
                    Container(
                      child: Text(
                        "LayOut",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(3.0),
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.5),
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ZIcon(
                            iconList: layoutIconList
                                .getRange(0, layoutIconList.length)
                                ?.toList(),
                          ),
                        ],
                      ),
                    ),
                    /* ******************************************************************************************* */
                    Container(
                      child: Text(
                        "listView",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(3.0),
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.5),
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ZIcon(
                            iconList: listViewIconList
                                .getRange(0, listViewIconList.length)
                                ?.toList(),
                          ),
                        ],
                      ),
                    ),
                    /* ******************************************************************************************* */
                    Container(
                      child: Text(
                        "bottomNavigator",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(3.0),
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.5),
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ZIcon(
                            iconList: bttmNavgIconList
                                .getRange(0, bttmNavgIconList.length)
                                ?.toList(),
                          ),
                        ],
                      ),
                    ),
                    /* ******************************************************************************************* */
                    Container(
                      child: Text(
                        "swiper",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(3.0),
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.5),
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ZIcon(
                            iconList: swiperIconList
                                .getRange(0, swiperIconList.length)
                                ?.toList(),
                          ),
                        ],
                      ),
                    ),
                    /* ******************************************************************************************* */
                    Container(
                      child: Text(
                        "HomePage",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(3.0),
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.5),
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ZIcon(
                            iconList: homePageIconList
                                .getRange(0, homePageIconList.length)
                                ?.toList(),
                          ),
                        ],
                      ),
                    ),
                    /* ******************************************************************************************* */
                    Container(
                      child: Text(
                        "MinePage",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(3.0),
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.5),
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ZIcon(
                            iconList: minePageIconList
                                .getRange(0, minePageIconList.length)
                                ?.toList(),
                          ),
                        ],
                      ),
                    ),
                    /* ******************************************************************************************* */
                    // Container(
                    //   child: Text(
                    //     "SearchPage",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   margin: const EdgeInsets.all(5.0),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.all(5.0),
                    //   padding: EdgeInsets.all(3.0),
                    //   height: 80,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black38, width: 1.5),
                    //       color: Colors.white10,
                    //       borderRadius: BorderRadius.circular(10.0)),
                    //   child: PageView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: <Widget>[
                    //       ZIcon(
                    //         iconList: homePageIconList
                    //             .getRange(0, homePageIconList.length)
                    //             ?.toList(),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    /* ******************************************************************************************* */
                    // Container(
                    //   child: Text(
                    //     "DetailPage",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   margin: const EdgeInsets.all(5.0),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.all(5.0),
                    //   padding: EdgeInsets.all(3.0),
                    //   height: 80,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black38, width: 1.5),
                    //       color: Colors.white10,
                    //       borderRadius: BorderRadius.circular(10.0)),
                    //   child: PageView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: <Widget>[
                    //       ZIcon(
                    //         iconList: homePageIconList
                    //             .getRange(0, homePageIconList.length)
                    //             ?.toList(),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    /* ******************************************************************************************* */
                    // Container(
                    //   child: Text(
                    //     "demos",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   margin: const EdgeInsets.all(5.0),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.all(5.0),
                    //   padding: EdgeInsets.all(3.0),
                    //   height: 160,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black38, width: 1.5),
                    //       color: Colors.white10,
                    //       borderRadius: BorderRadius.circular(10.0)),
                    //   child: PageView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: <Widget>[
                    //       ZIcon(
                    //         iconList: listViewIconList.length >= 10
                    //             ? listViewIconList.getRange(0, 10)?.toList()
                    //             : [],
                    //       ),
                    //       ZIcon(
                    //         iconList: listViewIconList.length >= 20
                    //             ? listViewIconList.getRange(10, 20)?.toList()
                    //             : [],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
