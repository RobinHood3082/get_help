// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counseling_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CounselingPost _$CounselingPostFromJson(Map<String, dynamic> json) =>
    CounselingPost(
      title: json['title'] as String,
      description: json['description'] as String,
      isAnonymous: json['isAnonymous'] as bool,
      studentID: json['studentID'] as String,
      studentName: json['studentName'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CounselingPostToJson(CounselingPost instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isAnonymous': instance.isAnonymous,
      'studentID': instance.studentID,
      'studentName': instance.studentName,
      'image': instance.image,
    };
