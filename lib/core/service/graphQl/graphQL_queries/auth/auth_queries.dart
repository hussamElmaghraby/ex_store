import 'package:ex_app/features/auth/data/models/login_request/login_request.dart';
import 'package:ex_app/features/auth/data/models/signup_request/sign_up_request.dart';

class AuthQuery {
  factory AuthQuery() => _instance;

  const AuthQuery._();

  static const AuthQuery _instance = AuthQuery._();


  //Login
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


  //SignUp
  Map<String, dynamic> signUpMapQuery({required SignUpRequest signUpRequest}) {
    return {
      'query': r'''
      mutation SignUp($name: String! , $avatar: String! , $email: String! , $password: String!) {
      		addUser(
		    data: {
			    name: $name
			    email: $email
			    password: $password
			    avatar: $avatar
		}
	) {
		    id
		    name
	}
      }
      ''',
      'variables': {
        'email': signUpRequest.email,
        'password': signUpRequest.password,
        'avatar': signUpRequest.avatar,
        'name': signUpRequest.name,
      },
    };
  }
}
