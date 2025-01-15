import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    required this.name,
    required this.password,
    required this.avatar,
    required this.email,
  });

  final String name;
  final String password;
  final String avatar;
  final String email;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
