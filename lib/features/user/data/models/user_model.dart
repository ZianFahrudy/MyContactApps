import 'package:json_annotation/json_annotation.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
part 'user_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.gender,
    required super.name,
    required super.avatar,
    required super.phone,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
