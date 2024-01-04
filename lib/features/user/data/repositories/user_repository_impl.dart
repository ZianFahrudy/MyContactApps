import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_contact_app/features/user/data/datasources/user_remote_datasources.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/features/user/domain/repositories/user_repository.dart';
import 'package:my_contact_app/infrastructure/error/failures.dart';
import 'package:my_contact_app/infrastructure/shared/constants/text_const.dart';
import 'package:my_contact_app/infrastructure/shared/extension/dio_exception_extension.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.remoteDataSource);
  final UserRemoteDataSource remoteDataSource;
  @override
  Future<Either<Failure, List<UserEntity>>> getUsers(UserBody body) async {
    try {
      final remoteData = await remoteDataSource.getUsers(body);

      return Right(remoteData);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.exceptionFormater(e.response!.statusCode ?? 511));
      } else {
        return Left(
          ServerFailure(
            e.message ?? TextConst.generalFailureMessage,
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getDetailUser(String body) async {
    try {
      final remoteData = await remoteDataSource.getUDetailser(body);

      return Right(remoteData);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.exceptionFormater(e.response!.statusCode ?? 511));
      } else {
        return Left(
          ServerFailure(
            e.message ?? TextConst.generalFailureMessage,
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> searchUser(UserBody body) async {
    try {
      final remoteData = await remoteDataSource.getUsers(body);

      return Right(remoteData);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.exceptionFormater(e.response!.statusCode ?? 511));
      } else {
        return Left(
          ServerFailure(
            e.message ?? TextConst.generalFailureMessage,
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
