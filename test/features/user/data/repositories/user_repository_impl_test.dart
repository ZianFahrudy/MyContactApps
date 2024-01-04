// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_contact_app/features/user/data/datasources/user_remote_datasources.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';

class MockUserRemoteDatasource extends Mock
    implements UserRemoteDataSourceImpl {}

void main() {
  final mockPokemonRemoteDatasource = MockUserRemoteDatasource();

  final pokemonRepositoryImpl = UserRepositoryImpl(mockPokemonRemoteDatasource);

  group(
    'Testing [getUserList]',
    () {
      const response = <UserEntity>[
        UserEntity(
          id: '1a',
          name: 'Zian Fahrudy',
          avatar: 'google.com',
          email: 'zian@ganteng.com',
          gender: 'l',
          phone: '08656565',
        ),
      ];

      final body = UserBody();

      test('Should return data when success', () {
        // arrange
        when(() => mockPokemonRemoteDatasource.getUsers(body))
            .thenAnswer((_) async => Future.value(response));

        //act
        final result = pokemonRepositoryImpl.getUsers(body);

        //assert
        verify(() => mockPokemonRemoteDatasource.getUsers(body));
        expect(result, completion(const Right(response)));
        verifyNoMoreInteractions(mockPokemonRemoteDatasource);
      });
    },
  );

  group(
    'Testing [getUserDetail]',
    () {
      const response = UserEntity(
        id: '1a',
        name: 'Zian Fahrudy',
        avatar: 'google.com',
        email: 'zian@ganteng.com',
        gender: 'l',
        phone: '08656565',
      );

      const body = '1a';

      test('Testing Get User Detail', () {
        // arrange
        when(() => mockPokemonRemoteDatasource.getUDetailser(body))
            .thenAnswer((_) async => Future.value(response));

        //act
        final result = pokemonRepositoryImpl.getDetailUser(body);

        //assert
        verify(() => mockPokemonRemoteDatasource.getUDetailser(body));
        expect(result, completion(const Right(response)));
        verifyNoMoreInteractions(mockPokemonRemoteDatasource);
      });
    },
  );
}
