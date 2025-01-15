import 'package:bloc/bloc.dart';
import 'package:ex_app/core/service/shared_pref/pref_keys.dart';
import 'package:ex_app/core/service/shared_pref/shared_pref.dart';
import 'package:ex_app/features/auth/data/models/login_request/login_request.dart';
import 'package:ex_app/features/auth/data/models/login_response/login_response.dart';
import 'package:ex_app/features/auth/data/models/signup_request/sign_up_request.dart';
import 'package:ex_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repos) : super(const _Initial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }

  final AuthRepos _repos;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _login(LoginEvent event, Emitter<AuthState> state) async {
    emit(const AuthState.loading());
    final result = await _repos.login(
      loginRequest: LoginRequest(
        emailController.text.trim(),
        passwordController.text.trim(),
      ),
    );

    await result.when(
      success: (LoginResponse loginData) async {
        await SharedPref().setString(
          PrefKeys.accessToken,
          loginData.data.login.accessToken ?? '',
        );
        //get user role
        final user = await _repos.userRole(
          token: loginData.data.login.accessToken ?? '',
        );
        await SharedPref().setString(
          PrefKeys.userRole,
          user.userRole ?? '',
        );
        await SharedPref().setInt(
          PrefKeys.userId,
          user.userId ?? 0,
        );
        emit(
          AuthState.success(userRole: user.userRole ?? ''),
        );
      },
      failure: (error) {
        emit(
          AuthState.error(
            error: error,
          ),
        );
      },
    );
  }

  Future<void> _signUp(SignUpEvent event, Emitter<AuthState> state) async {
    final result = await _repos.signUp(
      signUpRequest: SignUpRequest(
        name: nameController.text,
        password: passwordController.text,
        avatar: event.imageUrl,
        email: emailController.text,
      ),
    );

    result.when(success: (LoginResponse data) {
      add(const AuthEvent.login());
    }, failure: (String error) {
      emit(
        AuthState.error(
          error: error,
        ),
      );
    });
  }
}
