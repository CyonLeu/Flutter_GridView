import 'package:firstapp/sectionPages/CourseDetail.dart';
import 'package:flutter/material.dart';

///个人中心，列布局Column

class ListItem {
  final String title;
  final String subtitle;
  final IconData iconData;

  ListItem(this.title, this.subtitle, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: new Icon(listItem.iconData),
        title: new Text(listItem.title),
        trailing: new Text(listItem.subtitle),
        onTap: () {
          //弹出一个SnackBar
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new CourseDetail()));
//          Scaffold.of(context).showSnackBar(
//            new SnackBar(
//              content: Text(listItem.title),
//              action: new SnackBarAction(
//                  label: "撤销",
//                  onPressed: () {
//                    //撤销点击
//                  }),
//            ),
//          );
        });
  }

  _launchURL() async {
//    const url = 'https://flutter.io';
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
  }
}

///
class MineTab extends StatefulWidget {
  @override
  _MineTabState createState() => _MineTabState();
}

class _MineTabState extends State<MineTab> {
  final List<ListItem> listData = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 30; i++) {
      listData.add(ListItem("百宝箱标题$i", '>', Icons.calendar_today));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('个人中心'),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListItemWidget(listData[index]);
        },
        itemCount: listData.length,
      ),
    );
  }

  Widget buildColumns() {
    return new Column(
      mainAxisSize: MainAxisSize.max,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
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
