import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tmeny_flutter/common/ui/full_image_page/full_image_page.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class ProfileImagePage extends StatefulWidget {
  const ProfileImagePage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileImagePageState createState() => _ProfileImagePageState();
}

class _ProfileImagePageState extends State<ProfileImagePage> {
  CroppedFile? _croppedFile;
  final String _cropPageTitle = "Modify Image";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: const Text("Select Image")) : null,
      body: _image(),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      final File image = File(_croppedFile!.path);
      return InkWell(
        // Navigator.of(context).push(CustomPageRoute(page));

        onTap: () => FullImagePage.navigate(context, image: image),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 0.8 * screenWidth,
            maxHeight: 0.7 * screenHeight,
          ),
          child: Hero(
            tag: image,
            child: Image.file(
              image,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Future<void> _cropImage(XFile? pickedImage) async {
    if (pickedImage != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        cropStyle: CropStyle.circle,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: _cropPageTitle,
            toolbarColor: AppColors.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            hideBottomControls: true,
            showCropGrid: false,
            backgroundColor: AppColors.appBackgroundColor,
          ),
          IOSUiSettings(
            title: _cropPageTitle,
            hidesNavigationBar: true,
            aspectRatioLockEnabled: true,
            resetAspectRatioEnabled: false,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) async {
      if (value != null) {
        await _cropImage(value);
      }
    });
  }

  void _clear() {
    setState(() {
      _croppedFile = null;
    });
  }
}
