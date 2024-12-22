import 'package:ex_app/core/service/graphQl/api_service.dart';
import 'package:ex_app/core/service/graphQl/graphQL_queries/auth/auth_queries.dart';
import 'package:ex_app/features/auth/data/models/login_request/login_request.dart';
import 'package:ex_app/features/auth/data/models/login_response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:ex_app/features/auth/data/models/user_role_response/user_role_response.dart';

class AuthDatasource {
  const AuthDatasource(this._graphQl);

  final ApiService _graphQl;


  //Login
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    final LoginResponse  loginResponse= await _graphQl
        .login(AuthQuery().loginMapQuery(loginRequest: loginRequest));
    return loginResponse;
  }


  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client =  ApiService(dio);
    final  userRoleResponse = await client.userRole();
    return userRoleResponse;
  }
}
