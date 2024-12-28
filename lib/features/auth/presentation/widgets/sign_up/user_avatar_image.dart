import 'package:ex_app/core/app/bloc_observer.dart';
import 'package:ex_app/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ex_app/core/common/animations/animate_do.dart';
import 'package:ex_app/core/common/toast/show_toast.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/core/language/lang_keys.dart';
import 'package:ex_app/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (BuildContext context, UploadImageState state) {
          state.whenOrNull(
            success: () {
              ShowToast.showToastSuccessTop(
                context: context,
                message: context.translate(
                  LangKeys.imageUploaded,
                ),
              );
            },
            removeImage: (removedImage) {
              ShowToast.showToastErrorTop(
                context: context,
                message: context.translate(
                  LangKeys.imageRemoved,
                ),
              );
            }
          );
        },
        builder: (BuildContext context, UploadImageState state) {
          final isImageUpload =
              context.read<UploadImageCubit>().getImageUrl.isNotEmpty;
          return state.maybeWhen(
            loading: () => CircleAvatar(
              radius: 38,
              backgroundImage: const AssetImage(AppImages.userAvatar),
              child: Center(
                child: CircularProgressIndicator(
                  color: context.color.mainColor,
                ),
              ),
            ),
            orElse: () {
              return CircleAvatar(
                radius: 38,
                backgroundImage: isImageUpload
                    ? NetworkImage(context.read<UploadImageCubit>().getImageUrl)
                    : const AssetImage(
                        AppImages.userAvatar,
                      ),
                // backgroundColor: Colors.black.withOpacity(
                //   0.2,
                // ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    //remove image
                    if (isImageUpload)
                      Positioned(
                        top: -15,
                        right: -15,
                        child: IconButton(
                          onPressed: () {
                            context.read<UploadImageCubit>().removeImage();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),

                    // Take Image
                    if (isImageUpload)
                      const SizedBox.shrink()
                    else
                      IconButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().uploadImage();
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
