import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/features/user/domain/usecases/get_detail_user_usecase.dart';
import 'package:my_contact_app/features/user/domain/usecases/get_users_usecase.dart';
import 'package:my_contact_app/features/user/domain/usecases/search_user_usecase.dart';
import 'package:my_contact_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:my_contact_app/infrastructure/error/failures.dart';

class MockGetUserListUsecase extends Mock implements GetUserListUsecase {}

class MockGetUserDetailUsecase extends Mock implements GetDetailUserUsecase {}

class MockSearchUserUsecase extends Mock implements SearchUserListUsecase {}

void main() {
  late MockGetUserListUsecase mockGetUserListUsecase;
  late MockGetUserDetailUsecase mockGetUserDetailUsecase;
  late MockSearchUserUsecase mockSearchUserUsecase;
  late UserBloc userBloc;

  setUp(
    () async {
      mockGetUserListUsecase = MockGetUserListUsecase();
      mockGetUserDetailUsecase = MockGetUserDetailUsecase();
      mockSearchUserUsecase = MockSearchUserUsecase();
      userBloc = UserBloc(
        mockGetUserListUsecase,
        mockGetUserDetailUsecase,
        mockSearchUserUsecase,
      );
    },
  );

  group('User List ...', () {
    //response example
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

    //body example
    final body = UserBody();

    test('should get data from usecase', () async {
      // arrange
      when(() => mockGetUserListUsecase.call(body))
          .thenAnswer((_) async => Future.value(const Right(response)));

      //act
      userBloc.add(GetUsersEvent(body: body));
      await untilCalled(() => mockGetUserListUsecase.call(body));

      //assert
      verify(() => mockGetUserListUsecase.call(body));
    });

    blocTest<UserBloc, UserState>(
      'should emit[UserLoading, UserSuccess]',
      build: () {
        when(() => mockGetUserListUsecase.call(body))
            .thenAnswer((_) async => Future.value(const Right(response)));

        return userBloc;
      },
      act: (bloc) => bloc.add(
        GetUsersEvent(body: body),
      ),
      expect: () => [
        UserLoading(),
        const UserSuccess(response: response),
      ],
    );

    // s

    blocTest<UserBloc, UserState>(
      'should emit[UserLoading, UserFailure]',
      build: () {
        when(() => mockGetUserListUsecase.call(body)).thenAnswer(
          (_) async => Future.value(
            const Left(
              ServerFailure('server fail'),
            ),
          ),
        );

        return userBloc;
      },
      act: (bloc) => bloc.add(
        GetUsersEvent(body: body),
      ),
      expect: () => [UserLoading(), const UserFailure(message: 'server fail')],
    );
  });
}
