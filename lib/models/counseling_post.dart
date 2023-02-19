import 'package:json_annotation/json_annotation.dart';

part 'counseling_post.g.dart';

@JsonSerializable()
class CounselingPost {
  final String title;
  final String description;
  final bool isAnonymous;
  final String studentID;
  final String studentName;
  final String image;

  CounselingPost({
    required this.title,
    required this.description,
    required this.isAnonymous,
    required this.studentID,
    required this.studentName,
    required this.image,
  });

  factory CounselingPost.fromJson(Map<String, dynamic> json) =>
      _$CounselingPostFromJson(json);

  Map<String, dynamic> toJson() => _$CounselingPostToJson(this);
}
