// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      json['title'] as String,
      json['body'] as String,
      json['userId'] as int,
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
    };
