import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:tmeny_flutter/app_config.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/delete_otp_use_case.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/app_user.dart';
import 'package:flutter/material.dart';
import 'user/firebase_options_user.dart';

void main() async {
  const configureApp = AppConfig(
    environment: Environment.user,
    appTitle: "user",
    child: TheAppUser(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: UserFirebaseOptions.currentPlatform,
  //   name: "yolo-user-e6a3b",
  // );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values,);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark,);
  await initializeDependencies();
  DeleteOTPUseCase(injector()).execute();
  // injector<PreferencesHelper>().deleteToken();
  runApp(configureApp);
}


