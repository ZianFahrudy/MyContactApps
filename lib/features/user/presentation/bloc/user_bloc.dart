import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/features/user/domain/usecases/get_detail_user_usecase.dart';
import 'package:my_contact_app/features/user/domain/usecases/get_users_usecase.dart';
import 'package:my_contact_app/features/user/domain/usecases/search_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
    this._getUserListUsecase,
    this._getDetailUserUsecase,
    this._searchUserListUsecase,
  ) : super(UserInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoading());

      final failureOrSuccess = await _getUserListUsecase.call(event.body);

      failureOrSuccess.fold(
        (l) => emit(UserFailure(message: l.message)),
        (r) => emit(UserSuccess(response: r)),
      );
    });

    on<GetDetailUserEvent>((event, emit) async {
      emit(UserLoading());

      final failureOrSuccess = await _getDetailUserUsecase.call(event.body);

      failureOrSuccess.fold(
        (l) => emit(UserFailure(message: l.message)),
        (r) => emit(DetailUserSuccess(response: r)),
      );
    });

    on<SearchUsersEvent>((event, emit) async {
      emit(UserLoading());

      final failureOrSuccess = await _searchUserListUsecase.call(event.body);

      failureOrSuccess.fold(
        (l) => emit(UserFailure(message: l.message)),
        (r) => emit(UserSuccess(response: r)),
      );
    });
  }

  final GetUserListUsecase _getUserListUsecase;
  final GetDetailUserUsecase _getDetailUserUsecase;
  final SearchUserListUsecase _searchUserListUsecase;
}
