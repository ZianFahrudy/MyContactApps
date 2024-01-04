// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String gender;
  final String name;
  final String avatar;
  final String phone;
  final String email;
  const UserEntity({
    required this.id,
    required this.gender,
    required this.name,
    required this.avatar,
    required this.phone,
    required this.email,
  });
  @override
  List<Object?> get props {
    return [
      id,
      gender,
      name,
      avatar,
      phone,
      email,
    ];
  }
}
