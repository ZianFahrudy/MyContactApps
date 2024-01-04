import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_contact_app/features/user/data/datasources/user_remote_datasources.dart';
import 'package:my_contact_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:my_contact_app/features/user/domain/repositories/user_repository.dart';
import 'package:my_contact_app/features/user/domain/usecases/get_detail_user_usecase.dart';
import 'package:my_contact_app/features/user/domain/usecases/get_users_usecase.dart';
import 'package:my_contact_app/features/user/domain/usecases/search_user_usecase.dart';
import 'package:my_contact_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:my_contact_app/infrastructure/core/config/env_config.dart';
import 'package:my_contact_app/infrastructure/core/network/dio_handler.dart';
import 'package:my_contact_app/infrastructure/core/prefs/shared_prefs.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> init() async {
    final config = EnvConfig.getInstance();
    final prefs = await SharedPrefs.getInstance();

    // flavor, prefs, dio, etc
    sl
      ..registerLazySingleton(() => config)
      ..registerLazySingleton(() => prefs)
      ..registerLazySingleton<Dio>(() => sl<DioHandler>().dio)
      ..registerLazySingleton(
        () => DioHandler(config: sl(), preferences: sl()),
      )

      // Users
      ..registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(sl()),
      )
      ..registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
          sl(),
        ),
      )
      ..registerFactory(
        () => UserBloc(sl(), sl(), sl()),
      )
      ..registerLazySingleton(() => GetUserListUsecase(sl()))
      ..registerLazySingleton(() => SearchUserListUsecase(sl()))
      ..registerLazySingleton(() => GetDetailUserUsecase(sl()));
  }
}
