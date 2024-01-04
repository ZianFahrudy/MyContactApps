import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_app/features/user/data/models/user_model.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  const userModel = UserModel(
    id: '1a',
    name: 'Zian Fahrudy',
    avatar: 'google.com',
    email: 'zian@ganteng.com',
    gender: 'l',
    phone: '08656565',
  );

  group('testing user model', () {
    test('should be a subclass UserEntity', () {
      expect(userModel, isA<UserEntity>());
    });

    test('fromJson, should be return a valid model', () {
      //arrange
      final jsonMap = json.decode(fixture('user.json')) as Map<String, dynamic>;

      //act
      final result = UserModel.fromJson(jsonMap);

      //assert
      expect(result, userModel);
    });
  });
}
