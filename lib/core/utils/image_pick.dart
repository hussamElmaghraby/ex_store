import 'package:ex_app/core/di/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageUtils {
  factory PickImageUtils() => const PickImageUtils._();

  const PickImageUtils._();

  Future<XFile?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 10,
      );

      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } catch (e) {
      final permissionStatus = await Permission.photos.status;
      if (permissionStatus.isDenied) {
        // Show dialog
        await _showAlertPermissionsDialog();
      } else {
        debugPrint('Image Exception ==> $e');
      }
    }
  }

  Future<void> _showAlertPermissionsDialog() {
    return showCupertinoDialog(
      context: sl<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text('Settings'),
              onPressed: () => openAppSettings,
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
