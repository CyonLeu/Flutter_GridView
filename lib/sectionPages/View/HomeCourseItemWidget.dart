import 'package:firstapp/Model/HomeCourseModel.dart';
import 'package:flutter/material.dart';

class HomeCourseItemWidget extends StatelessWidget {
  final HomeCourseModel item;

  HomeCourseItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(item.title),
        ));
      },
      child: new Container(
        color: Color(0xfff8f8f8),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.network(item.pic),
            new Text(item.title,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black)),
            new Text(item.subtitle,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
