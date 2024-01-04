import 'package:dartz/dartz.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/infrastructure/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers(UserBody body);
  Future<Either<Failure, UserEntity>> getDetailUser(String body);
  Future<Either<Failure, List<UserEntity>>> searchUser(UserBody body);
}
