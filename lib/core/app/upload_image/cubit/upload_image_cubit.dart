import 'package:bloc/bloc.dart';
import 'package:ex_app/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:ex_app/core/utils/image_pick.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_state.dart';

part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo) : super(UploadImageState.initial());

  final UploadImageRepo _repo;

  String getImageUrl = '';

  Future<void> uploadImage() async {
    final pickedImage = await PickImageUtils().pickImage();
    if (pickedImage == null) return;
    emit(const UploadImageState.loading());
    final result = await _repo.uploadImage(pickedImage);
    result.when(success: (image) {
      getImageUrl = image.location ?? '';
      emit(const UploadImageState.success());
    }, failure: (error) {
      emit(UploadImageState.error(error: error));
    });
  }
  
  
  void removeImage(){
    getImageUrl = '';
    emit(UploadImageState.removeImage(imageUrl: getImageUrl));
  }
}
