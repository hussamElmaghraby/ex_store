// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      name: json['name'] as String,
      password: json['password'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'avatar': instance.avatar,
      'email': instance.email,
    };
