import 'package:flutter/material.dart';
import 'package:flutter_demos/home/jingdong/sliver_header.dart';
import 'package:flutter_demos/home/jingdong/swipper_image.dart';
import 'package:flutter_demos/home/jingdong/floor.dart';
import 'package:flutter_demos/home/jingdong/item.dart';
import 'package:flutter_demos/home/jingdong/bean/floor/floor_model_entity.dart';
import 'package:flutter_demos/home/jingdong/bean/item/recommend_item_response.dart';

class JingDongHomePage extends StatefulWidget {
  @override
  _JingDongHomePageState createState() => _JingDongHomePageState();
}

class _JingDongHomePageState extends State<JingDongHomePage> {
  List<FloorModelResultContentData> floorList = [];
  List<SwipperOptions> swipperOptionsList = [];
  List<WareInfo> itemList = [];
  String swipperBgImageUrl;
  bool loading = true;
  @override
  initState() {
    super.initState();
    init();
  }

  //底部导航菜单-页面
  int _currentBottomIndex = 0;

  init() async {
    loading = true;

    //静态数据
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic001.jpg",
          jumpUrl: ""),
    );
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic002.jpg",
          jumpUrl: ""),
    );
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic003.jpg",
          jumpUrl: ""),
    );
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic004.jpg",
          jumpUrl: ""),
    );
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic005.jpg",
          jumpUrl: ""),
    );
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic006.jpg",
          jumpUrl: ""),
    );
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic007.jpg",
          jumpUrl: ""),
    );
    swipperOptionsList.add(
      SwipperOptions(
          imageUrl: "assets/images/home/jingdong/sildbanner/pic008.jpg",
          jumpUrl: ""),
    );

    swipperBgImageUrl = "assets/images/home/jingdong/homeBg1.jpg";

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test1", id: 1));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test2", id: 2));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test3", id: 3));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test4", id: 4));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test5", id: 5));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test6", id: 6));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test7", id: 7));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test8", id: 8));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test9", id: 9));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/apple.png", name: "test10", id: 10));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test11",
        id: 11));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test12",
        id: 12));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test13",
        id: 13));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test14",
        id: 14));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test15",
        id: 15));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test16",
        id: 16));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test17",
        id: 17));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test18",
        id: 18));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test19",
        id: 19));

    floorList.add(FloorModelResultContentData(
        icon: "assets/images/home/jingdong/camera.png",
        name: "test20",
        id: 20));

    itemList.add(
        WareInfo("11", "1111", 0, "assets/images/home/jingdong/item1.png"));
    itemList.add(
        WareInfo("22", "2222", 1, "assets/images/home/jingdong/item1.png"));
    itemList.add(
        WareInfo("33", "3333", 0, "assets/images/home/jingdong/item1.png"));
    itemList.add(
        WareInfo("44", "4444", 0, "assets/images/home/jingdong/item1.png"));

    loading = false;
  }

  /// 获取初始化数据
  // Future getInitData() async {
  //   var response = await RequestUtil.getInstance().post(Api.home);
  //   var data = EntityFactory.generateOBJ<WelcomeHome>(response.data);
  //   this.setState(() {
  //     var swipperList =
  //         data.floorList[0]?.content != null ? data.floorList[0]?.content : [];
  //     var list = (swipperList as List).map((val) {
  //       return SwipperOptions(
  //           imageUrl: val['horizontalImag'],
  //           jumpUrl: val['jump']['params']['url']);
  //     });
  //     swipperBgImageUrl = data.topBgImgBig;
  //     swipperOptionsList = list.toList();
  //     var appCenter = data.floorList
  //         .firstWhere((FloorList floor) => floor.type == 'appcenter');
  //     floorList =
  //         (appCenter.content['data'] as List<dynamic>).map((dynamic item) {
  //       return FloorModelResultContentData(
  //           name: item['name'], icon: item['icon']);
  //     }).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverHeader(),
                      SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(swipperBgImageUrl),
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.bottomCenter),
                              ),
                              child: SwipperImage(
                                width: MediaQuery.of(context).size.width,
                                swipperOptionsList: swipperOptionsList,
                              ),
                            ),
                            Container(
                              height: 158,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/home/jingdong/homeBg2.jpg"),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Floor(
                                    floorList: floorList.length >= 10
                                        ? floorList.getRange(0, 10)?.toList()
                                        : [],
                                  ),
                                  Floor(
                                    floorList: floorList.length >= 20
                                        ? floorList.getRange(10, 20)?.toList()
                                        : [],
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                                "assets/images/home/jingdong/homeBg3.jpg"),
                          ],
                        ),
                      ),
                      SliverPadding(
                        sliver: SliverGrid(
                          //Grid
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, //Grid按两列显示
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1 / 1.35,
                          ),

                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              //创建子widget
                              return Item(
                                item: this.itemList[index],
                              );
                            },
                            childCount: this.itemList.length,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                    ],
                  ),
                )
              ],
            ),

      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        backgroundColor: _currentBottomIndex == 2 ? Colors.red : Colors.green,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.search)]),
        onPressed: () {
          setState(() {
            _currentBottomIndex = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //底部导航菜单
      bottomNavigationBar: _getAppBottomTabs,
    );
  }

  //创建底部导航功能
  get _getAppBottomTabs => BottomAppBar(
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
              icon: Icon(Icons.sort),
              color: _currentBottomIndex == 1 ? Colors.red : Colors.grey,
              onPressed: () {
                _onBottomTabTapped(1);
              },
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
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
