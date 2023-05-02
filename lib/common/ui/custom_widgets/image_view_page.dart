import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';

class ImagePreviewPage extends StatefulWidget {
  final ImageProvider imageProvider;

  const ImagePreviewPage({Key? key, required this.imageProvider})
      : super(key: key);

  factory ImagePreviewPage.file(String path) {
    return ImagePreviewPage(
        imageProvider: FileImage(File.fromUri(Uri.file(path))));
  }

  factory ImagePreviewPage.network(String url) {
    return ImagePreviewPage(imageProvider: NetworkImage(url));
  }

  @override
  // ignore: library_private_types_in_public_api
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
        title: CommonLocalizer.previewImage,
        tintColor: Colors.white,
        context: context,
        useCloseButton: true,
        actions: [],
      ),
      backgroundColor: Colors.black,
      body: PhotoView(
        imageProvider: widget.imageProvider,
      ),
    );
  }
}
