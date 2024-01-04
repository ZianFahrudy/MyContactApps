// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UserEvent {
  final UserBody body;
  const GetUsersEvent({
    required this.body,
  });
}

class GetDetailUserEvent extends UserEvent {
  final String body;
  const GetDetailUserEvent({
    required this.body,
  });
}

class SearchUsersEvent extends UserEvent {
  final UserBody body;
  const SearchUsersEvent({
    required this.body,
  });
}
