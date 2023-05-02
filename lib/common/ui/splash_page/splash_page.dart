import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/Images_path.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  static const Duration delayDuration = Duration(seconds: 2);
  Timer? timer;

  @override
  void initState() {
    timer = Timer(delayDuration, () {
      AuthenticationBloc.of(context).add(AppStartedEvent());
      timer?.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
timer?.cancel();    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary_300,
      body: Center(
        child: Image.asset(AssetsPath.splashImage, scale: 3.5),
      ),
    );
  }
}
