import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/data/models/user_model.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/infrastructure/error/exception.dart';
import 'package:my_contact_app/infrastructure/shared/constants/api_path.dart';

abstract class UserRemoteDataSource {
  Future<List<UserEntity>> getUsers(UserBody body);
  Future<UserEntity> getUDetailser(String body);
  Future<List<UserEntity>> searchUsers(UserBody body);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this._client);
  final Dio _client;
  @override
  Future<List<UserEntity>> getUsers(UserBody body) async {
    try {
      final response = await _client.get<String>(
        ApiPath.users,
        queryParameters: body.toJson(),
      );

      final users = (jsonDecode(response.data!) as List)
          .map((data) => UserModel.fromJson(data as Map<String, dynamic>))
          .toList();

      return users;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserEntity> getUDetailser(String body) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '${ApiPath.users}/$body',
      );

      return UserModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<UserEntity>> searchUsers(UserBody body) async {
    try {
      final response = await _client.get<String>(
        ApiPath.users,
        queryParameters: body.toJson(),
      );

      final users = (jsonDecode(response.data!) as List)
          .map((data) => UserModel.fromJson(data as Map<String, dynamic>))
          .toList();

      return users;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
