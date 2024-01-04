// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'user_body.g.dart';

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
class UserBody {
  final String? name;
  final String? gender;
  final int? page;
  final int? limit;
  UserBody({
    this.name,
    this.gender,
    this.page,
    this.limit,
  });

  Map<String, dynamic> toJson() => _$UserBodyToJson(this);
}
