import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {

  SignUpResponse(this.data);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  final SignupDataModel data;
}


@JsonSerializable()
class SignupDataModel {
  SignupDataModel(this.addUser);

  factory SignupDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignupDataModelFromJson(json);

  final AddUserModel addUser;
}


@JsonSerializable()
class AddUserModel {
  AddUserModel(this.id, this.email);

  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);

  final String id;
  final String email;
}