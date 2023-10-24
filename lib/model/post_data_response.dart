// import 'package:json_annotation/json_annotation.dart';

// part 'DataPost.g.dart';

// @JsonSerializable()
// class DataPost {
//   @JsonKey(name : "title")
//   String title;

//   @JsonKey(name : "body")
//   String body;

//   @JsonKey(name : "userId")
//   int userId;


//   //User({required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});
//   DataPost(this.title, this.body, this.userId);
//   factory DataPost.fromJson(Map<String, dynamic> json) => _$DataPostFromJson(json);
//   Map<String, dynamic> toJson() => _$DataPostToJson(this);

// }

import 'package:json_annotation/json_annotation.dart';
part 'post_data_response.g.dart';

@JsonSerializable()
class PostData {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'body')
  String body;
  @JsonKey(name: 'userId')
  int userId;

  

  PostData(this.title, this.body, this.userId);
  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
  Map<dynamic, dynamic> toJson() => _$PostDataToJson(this);
}
