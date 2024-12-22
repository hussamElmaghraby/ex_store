import 'package:ex_app/core/app/app_cubit/app_cubit.dart';
import 'package:ex_app/core/service/graphQl/api_service.dart';
import 'package:ex_app/core/service/graphQl/dio_factory.dart';
import 'package:ex_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:ex_app/features/auth/data/repos/auth_repo.dart';
import 'package:ex_app/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setUpInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(AppCubit.new)
    ..registerSingleton(ApiService(dio));
}

Future<void> _initAuth() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(() => AuthBloc(sl<AuthRepos>()))
    ..registerFactory(() => AuthRepos(datasource: sl<AuthDatasource>()))
    ..registerFactory(() => AuthDatasource(sl<ApiService>()))
    ..registerSingleton(dio);
}
