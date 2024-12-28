import 'package:ex_app/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:ex_app/core/app/upload_image/models/upload_image_response.dart';
import 'package:ex_app/core/service/graphQl/api_result.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageRepo {
  const UploadImageRepo(this._dataSource);

  final UploadImageDataSource _dataSource;

  Future<ApiResult<UploadImageResource>> uploadImage(XFile imageFile) async {
    try {
      final response = await _dataSource.uploadImage(imageFile: imageFile);
      return ApiResult.success(
        response,
      );
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }
}
