import 'dart:io';

import 'package:firstapp/Model/HomeCourseModel.dart';
import 'package:firstapp/Network/NetworkManager.dart';
import 'package:flutter/material.dart';
//import 'package:json_serializable/json_serializable.dart';

class StudyTab extends StatefulWidget {
  @override
  _StudyTabState createState() => _StudyTabState();
}

class _StudyTabState extends State<StudyTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('学习'),
//      ),
      body: new Center(
        child: new Text('学习页'),
      ),
    );
  }

  _queryData() async {
//    var httpClient = new HttpClient();

    String url = 'home/index';
    var res = await NetworkManager.get(
        url, null, {"Accept": 'application/json,text/json,text/html'}, null);
    if (res != null && res.result) {
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

//      return new DataResult(list, true);
    } else {
//      return new DataResult(null, false);
    }
  }
}
