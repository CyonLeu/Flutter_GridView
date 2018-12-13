import 'package:flutter/material.dart';

import 'sectionPages/GroupTab.dart';
import 'sectionPages/HomeTab.dart';
import 'sectionPages/MineTab.dart';
import 'sectionPages/StudyTab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Color(0xFF2bc329),
        textSelectionColor: Color(0xFFFFFFF),
      ),
      home: MyHomePage(title: '飞鱼'),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        length: 4, //Tab页的个数
        vsync: this //动画效果的异步处理，默认格式
        );
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          //创建之前写好的三个页面，万物皆是Widget
          new HomeTab(),
          new StudyTab(),
          new GroupTab(),
          new MineTab(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white12,
        child: new TabBar(
          controller: tabController,
          tabs: <Tab>[
            new Tab(text: "首页", icon: new Icon(Icons.home)),
            new Tab(text: "学习", icon: new Icon(Icons.android)),
            new Tab(text: "小组", icon: new Icon(Icons.group)),
            new Tab(text: "我", icon: new Icon(Icons.settings)),
          ],
          labelColor: Color(0xFF2bc329),
          unselectedLabelColor: Colors.grey,
        ),
      ),
    );
  }

  //组件即将销毁时调用
  @override
  void dispose() {
    //释放内存，节省开销
    tabController.dispose();
    super.dispose();
  }
}
