import 'package:firstapp/Model/HomeCourseModel.dart';
import 'package:firstapp/Network/NetworkManager.dart';
import 'package:firstapp/Network/ResultData.dart';
import 'package:firstapp/sectionPages/View/HomeCourseItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///系统

//import 'package:english_words/english_words.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<HomeCourseModel> listData = [];

  @override
  void initState() {
    super.initState();
//    String pic =
//        "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2994888543,4121663290&fm=173&app=49&f=JPEG?w=640&h=427&s=AB1C608446348DDECED67F890300309C";
//
//    for (int i = 0; i < 20; i++) {
//      listData.add(new HomeCourseModel(i, 200, "视频标题$i", "副标题", "", pic));
//    }
    _queryData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('首页'),
        //在appbar上面添加一个列表图标，可点击跳转新节目
//        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.android), onPressed: _pushSaved)
//        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行2个
          mainAxisSpacing: 2.0, //主轴(竖直)方向间距
          crossAxisSpacing: 3.0, //纵轴(水平)方向间距
          childAspectRatio: 1.0 //纵轴缩放比例
          ),
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) {
        return HomeCourseItemWidget(listData[index]);
      },
    );
  }

  _queryData() async {
//    var httpClient = new HttpClient();

    var params = Map();
    params['start'] = '0';
    params['rows'] = '40';

    String url = 'course/guess_love';
    ResultData res = await NetworkManager.get(
        url, params, {"Accept": 'application/json,text/json,text/html'}, null);
    if (res != null && res.data != null) {
      List<HomeCourseModel> list = new List();
      var data = res.data;
      if (data == null || data.length == 0) {
//        return new DataResult(null, false);
      } else {
        for (int i = 0; i < data.length; i++) {
          Map item = data[i];
//          HomeCourseModel course = new HomeCourseModel(item['id'], item['views'], item['title'], item['sub_title'], item['course_id'], item['pic']);
          HomeCourseModel course = new HomeCourseModel.fromJson(item);
          print(course);
          if (course != null) {
            list.add(course);
          }
        }
      }

      if (list.length > 0) {
        listData.addAll(list);
      }

      setState(() {});
//      return new DataResult(list, true);
    } else {
//      return new DataResult(null, false);
    }
  }

  //appbar上的列表图标点击事件
//  void _pushSaved() {
//    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//      final titles = _saved.map((pair) {
//        return new ListTile(
//          title: new Text(
//            pair.asPascalCase,
//            style: _textFont,
//          ),
//        );
//      });
//      final divided =
//          ListTile.divideTiles(context: context, tiles: titles).toList();
//
//      return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("new page"),
//        ),
//        body: new ListView(children: divided),
//      );
//    }));
//  }
//  MaterialPageRoute
}
