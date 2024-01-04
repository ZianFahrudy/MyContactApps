// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/features/user/domain/repositories/user_repository.dart';
import 'package:my_contact_app/features/user/domain/usecases/get_detail_user_usecase.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  final mockUserRepository = MockUserRepository();

  group(
    'Should get success user detail from repository',
    () {
      final usecase = GetDetailUserUsecase(mockUserRepository);
      const body = '1a';

      test(
        'Testing Get User Detail',
        () {
          const response = UserEntity(
            id: '1a',
            name: 'Zian Fahrudy',
            avatar: 'google.com',
            email: 'zian@ganteng.com',
            gender: 'l',
            phone: '08656565',
          );

          // arrange
          when(() => mockUserRepository.getDetailUser(body))
              .thenAnswer((_) async => Future.value(const Right(response)));

          // act
          final result = usecase.call(body);

          //assert
          expect(result, completion(const Right(response)));
          verify(() => mockUserRepository.getDetailUser(body));
          verifyNoMoreInteractions(mockUserRepository);
        },
      );
    },
  );
}
