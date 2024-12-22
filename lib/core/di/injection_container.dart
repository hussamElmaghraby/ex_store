import 'package:ex_app/core/app/app_cubit/app_cubit.dart';
import 'package:ex_app/core/service/graphQl/api_service.dart';
import 'package:ex_app/core/service/graphQl/dio_factory.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setUpInjector() async {
  await _initCore();
}

Future<void> _initCore() async {
  final dio  = DioFactory.getDio();
  sl..registerFactory(AppCubit.new)
  ..registerSingleton(ApiService(dio));
}
