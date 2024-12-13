import 'package:ex_app/core/common/animations/animate_do.dart';
import 'package:ex_app/core/common/widgets/text_app.dart';
import 'package:flutter/material.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFadeInDown(
      duration: 400,
      child: CircleAvatar(
        radius: 38,
        backgroundImage: NetworkImage('https://leonardodavincischool.org/sites/main/files/imagecache/lightbox/main-images/camera_lense_0.jpeg'),
      ),
    );
  }
}
