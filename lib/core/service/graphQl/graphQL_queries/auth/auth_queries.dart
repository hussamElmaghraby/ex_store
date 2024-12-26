import 'package:ex_app/features/auth/data/models/login_request/login_request.dart';

class AuthQuery {
  factory AuthQuery() => _instance;

  const AuthQuery._();

  static const AuthQuery _instance = AuthQuery._();

  Map<String, dynamic> loginMapQuery({required LoginRequest loginRequest}) {
    return {
      'query': r'''
      mutation Login($email: String! , $password: String!) {
      	login(email: $email, password: $password) {
		      access_token
		      refresh_token
	     }
      }
      ''',
      'variables': {
        'email': loginRequest.email,
        'password': loginRequest.password,
      },
    };
  }
}
