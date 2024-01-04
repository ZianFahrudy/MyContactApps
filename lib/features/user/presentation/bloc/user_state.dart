// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<UserEntity> response;
  const UserSuccess({
    required this.response,
  });
}

class DetailUserSuccess extends UserState {
  final UserEntity response;
  const DetailUserSuccess({
    required this.response,
  });
}

class UserFailure extends UserState {
  final String message;
  const UserFailure({
    required this.message,
  });
}

// class SearchUserSuccess extends UserState {
//   final UserEntity response;
//   SearchUserSuccess({
//     required this.response,
//   });
// }
