import 'package:ex_app/core/service/graphQl/api_result.dart';
import 'package:ex_app/core/utils/app_strings.dart';
import 'package:ex_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:ex_app/features/auth/data/models/login_request/login_request.dart';
import 'package:ex_app/features/auth/data/models/login_response/login_response.dart';


class AuthRepos {
  AuthRepos({required AuthDatasource datasource}) : _datasource = datasource;

  final AuthDatasource _datasource;

  Future<ApiResult<LoginResponse>> login({required LoginRequest loginResponse} )async{
    try {
      final response = await _datasource.login(loginRequest: loginResponse);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}