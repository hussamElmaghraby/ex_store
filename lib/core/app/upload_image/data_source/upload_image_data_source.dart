import 'package:ex_app/core/app/upload_image/models/upload_image_response.dart';
import 'package:ex_app/core/service/graphQl/api_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class UploadImageDataSource {
  UploadImageDataSource({required ApiService apiService}) : _apiService = apiService;

  final ApiService _apiService;

  Future<UploadImageResource> uploadImage({
    required XFile imageFile,
  }) async {
    final formData = FormData();
    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(imageFile.path),
      ),
    );
    final response = await _apiService.uploadImage(formData);
    return response;
  }
}
