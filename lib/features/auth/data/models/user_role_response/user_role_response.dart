
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_response.g.dart';
@JsonSerializable()
class UserRoleResponse {
  UserRoleResponse(this.userRole, this.userId);

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) => _$UserRoleResponseFromJson(json);

  @JsonKey(name: 'user_role')
  final String? userRole;
  @JsonKey(name: 'user_id')
  final int? userId;


}