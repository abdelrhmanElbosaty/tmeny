import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/images_path.dart';
import 'package:tmeny_flutter/user/user_walkthrough/ui/widgets/bg_video.dart';
import 'widgets/walkthrow_page_body.dart';

class UserWalkThrowPage extends StatelessWidget {
  const UserWalkThrowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsPath.walkThrowFirstFrameImage),
                fit: BoxFit.fill)),
        child: Stack(
          children: const [
            WalkThrowBgVideo(),
            WalkThrowPageBody(),
          ],
        ),
      ),
    );
  }
}
