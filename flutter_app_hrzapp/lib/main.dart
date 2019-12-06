import 'package:flutter/material.dart';
import 'package:flutter_custom_bottom_tab_bar/tabbar.dart';
import 'package:flutter_custom_bottom_tab_bar/eachtab.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_hrzapp/componments/home/Home.dart';
import 'package:flutter_app_hrzapp/componments/vip/VIP.dart';
import 'package:flutter_app_hrzapp/componments/mine/Mine.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner:false, //是否显示底部
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Entry(),
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class Entry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EntryState();
  }
}

class EntryState extends State<Entry> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  var titles = ['首页', '会员', '我的'];
  var icons = [
    Icon(IconData(0xe606, fontFamily: 'iconfont')),
    Icon(IconData(0xe603, fontFamily: 'iconfont')),
    Icon(IconData(0xe604, fontFamily: 'iconfont')),
  ];
  @override
  void initState() {
    super.initState();
    _tabController =
    new TabController(vsync: this, initialIndex: 0, length: titles.length);
    _tabController.addListener(() {
      setState(() => _selectedIndex = _tabController.index);
      print("liucheng-> ${_tabController.indexIsChanging}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 46,
        child: Column(
          children: <Widget>[
            Divider(
              height: 2,
            ),
            new TabBar(
              isScrollable: false,
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.red,
              labelPadding: EdgeInsets.all(0),
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                EachTab(
                    width: 70,
                    badgeNo: '12',
                    badgeColor: Colors.red,
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 0
                        ? Image.asset(
                      'images/tab_home_selected.png',
                      width: 20,
                      height: 20,
                    )
                        : Image.asset(
                      'images/tab_home.png',
                      width: 20,
                      height: 20,
                    ),
                    text: titles[0],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 1
                        ? Image.asset(
                      'images/icon_vip_press.png',
                      width: 20,
                      height: 20,
                    )
                        : Image.asset(
                      'images/icon_vip_default.png',
                      width: 20,
                      height: 20,
                    ),
                    text: titles[1],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 2
                        ? Image.asset(
                      'images/icon_mine_press.png',
                      width: 20,
                      height: 20,
                    )
                        : Image.asset(
                      'images/icon_mine_default.png',
                      width: 20,
                      height: 20,
                    ),
                    text: titles[2],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),

      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), //设置滑动的效果，这个禁用滑动
        controller: _tabController,
        children: <Widget>[
          Home(),
          Text(titles[1]),
          Text(titles[2]),
        ],
      ),
    );
  }
}




class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(),VIP(),Mine()];

  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe606, fontFamily: 'iconfont')),
        title: Text("首页")
    ),
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe603, fontFamily: 'iconfont')),
        title: Text("会员")
    ),
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe604, fontFamily: 'iconfont')),
        title: Text("我的")
    ),
  ];


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _list,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
      body: _children[_currentIndex],
    );
  }

  //点击事件
  void onTabTapped(int index) {
    //通过setState告诉Scaffold,你点击了哪一个，它在显示哪一个了
    setState(() {
      _currentIndex = index;
    });
  }
}
