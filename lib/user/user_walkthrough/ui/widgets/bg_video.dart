import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/images_path.dart';

class WalkThrowBgVideo extends StatefulWidget {
  const WalkThrowBgVideo({Key? key}) : super(key: key);

  @override
  State<WalkThrowBgVideo> createState() => _WalkThrowBgVideoState();
}

class _WalkThrowBgVideoState extends State<WalkThrowBgVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late AssetImage _backgroundOfVideo;


  @override
  void initState() {
    _backgroundOfVideo = const AssetImage(AssetsPath.walkThrowFirstFrameImage);
    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _playVideo();
    super.didChangeDependencies();
  }

  void _playVideo() async {
    _controller = VideoPlayerController.asset(AssetsPath.walkThrowBgVideo,);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    await _controller.play();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return VideoPlayer(
              _controller,
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: _backgroundOfVideo, fit: BoxFit.fill),
              ),
            );
          }
        },
      ),
    );
  }
}
