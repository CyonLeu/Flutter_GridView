import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstapp/Model/HomeCourseModel.dart';
import 'package:firstapp/sectionPages/Video/VideoPlayPage.dart';
import 'package:flutter/material.dart';

class HomeCourseItemWidget extends StatelessWidget {
  final HomeCourseModel item;

  HomeCourseItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        VideoPlayPage videoPage = new VideoPlayPage();
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => videoPage));
//        Scaffold.of(context).showSnackBar(new SnackBar(
//          content: new Text(item.title),
//        ));
      },
      child: new Container(
        color: Color(0xfff7f7f7),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            new Image(image: new CachedNetworkImageProvider(item.pic)),
//            new CachedNetworkImage(
//              imageUrl: item.pic,
//              placeholder: new CircularProgressIndicator(),
//              errorWidget: new Icon(Icons.error),
//            ),
            new Image.network(
              item.pic,
              fit: BoxFit.cover,
            ),
            new Text(item.title,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black)),
//            new Text(item.subtitle,
//                textAlign: TextAlign.justify,
//                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
