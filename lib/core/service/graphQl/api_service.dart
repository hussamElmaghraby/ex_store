import 'package:dio/dio.dart';
import 'package:ex_app/core/app/upload_image/models/upload_image_response.dart';
import 'package:ex_app/features/auth/data/models/login_response/login_response.dart';
import 'package:ex_app/features/auth/data/models/user_role_response/user_role_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponse> login(@Body() Map<String, dynamic> mutation);

  @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole();


  @POST('/api/v1/files/upload')
  Future<UploadImageResource> uploadImage(@Body() FormData file);
}
