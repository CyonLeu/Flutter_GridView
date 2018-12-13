import 'package:flutter/material.dart';

class GroupTab extends StatefulWidget {
  @override
  _GroupTabState createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('小组'),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              color: Colors.pinkAccent,
              child: buildRows(),
              width: 375,
              height: 300,
            ),
            new Container(
              color: Colors.blueAccent,
              child: buildColumns(),
              width: 375,
              height: 300,
            ),
          ],
        ));
  }

  Widget buildRows() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      textDirection: TextDirection.rtl,
      children: <Widget>[
        new Icon(
          Icons.info,
        ),
        new Icon(
          Icons.map,
          size: 60,
        ),
        new Icon(
          Icons.email,
        ),
      ],
    );
  }

  Widget buildColumns() {
    return new Column(
      mainAxisSize: MainAxisSize.max,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        new Icon(
          Icons.info,
        ),
        new Icon(
          Icons.mail,
          size: 60,
        ),
        new Icon(
          Icons.map,
        ),
      ],
    );
  }
}
