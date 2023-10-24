
import 'user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_user_response.g.dart';

@JsonSerializable()
class SingleUserResponse{

  SingleUserResponse({required this.user});

  @JsonKey(name : "data")
  User user;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) => _$SingleUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);

}