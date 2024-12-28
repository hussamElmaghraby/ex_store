import 'package:ex_app/core/app/app_cubit/app_cubit.dart';
import 'package:ex_app/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ex_app/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:ex_app/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:ex_app/core/service/graphQl/api_service.dart';
import 'package:ex_app/core/service/graphQl/dio_factory.dart';
import 'package:ex_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:ex_app/features/auth/data/repos/auth_repo.dart';
import 'package:ex_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setUpInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(AppCubit.new)
    ..registerSingleton(ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navKey)
    ..registerFactory(() => UploadImageCubit(sl<UploadImageRepo>()))
    ..registerFactory(() => UploadImageRepo(sl<UploadImageDataSource>()))
    ..registerFactory(
      () => UploadImageDataSource(
        apiService: sl<ApiService>(),
      ),
    );
}

Future<void> _initAuth() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(() => AuthBloc(sl<AuthRepos>()))
    ..registerFactory(() => AuthRepos(datasource: sl<AuthDatasource>()))
    ..registerFactory(() => AuthDatasource(sl<ApiService>()))
    ..registerSingleton(dio);
}
