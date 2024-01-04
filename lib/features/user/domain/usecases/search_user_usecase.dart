import 'package:dartz/dartz.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/features/user/domain/repositories/user_repository.dart';
import 'package:my_contact_app/infrastructure/core/usecase/usecase.dart';
import 'package:my_contact_app/infrastructure/error/failures.dart';

class SearchUserListUsecase extends UseCase<List<UserEntity>, UserBody> {
  SearchUserListUsecase(this._repository);
  final UserRepository _repository;

  @override
  Future<Either<Failure, List<UserEntity>>> call(UserBody params) {
    return _repository.searchUser(params);
  }
}
