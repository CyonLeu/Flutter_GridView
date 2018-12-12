//import 'package:json_annotation/json_annotation.dart';

//part 'HomeCourseModel.g.dart';

//@JsonSerializable()
class HomeCourseModel extends Object {
  int id;
  int views;
  String title;
//  @JsonKey(name:'sub_title')
  String subtitle;
//  @JsonKey(name:'course_id')
  String courseID;
  String pic;

  HomeCourseModel(
    this.id,
    this.views,
    this.title,
    this.subtitle,
    this.courseID,
    this.pic,
  );
//  factory HomeCourseModel.fromJson(Map<String, dynamic> json) => _$HomeCourseModelFromJson(json);
//
//  Map<String, dynamic> toJson() => _$HomeCourseModelToJson(this);

  HomeCourseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        views = json['views'],
        title = json['title'],
        subtitle = json['sub_title'],
        courseID = json['course_id'],
        pic = json['pic'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'views': views,
        'title': title,
        'sub_title': subtitle,
        'course_id': courseID,
        'pic': pic
      };
}
