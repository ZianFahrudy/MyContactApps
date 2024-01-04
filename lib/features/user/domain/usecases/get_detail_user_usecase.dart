import 'package:dartz/dartz.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/features/user/domain/repositories/user_repository.dart';
import 'package:my_contact_app/infrastructure/core/usecase/usecase.dart';
import 'package:my_contact_app/infrastructure/error/failures.dart';

class GetDetailUserUsecase extends UseCase<UserEntity, String> {
  GetDetailUserUsecase(this._repository);
  final UserRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(String params) {
    return _repository.getDetailUser(params);
  }
}
