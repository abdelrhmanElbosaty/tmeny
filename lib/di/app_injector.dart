import 'package:get_it/get_it.dart';
import 'package:tmeny_flutter/common/di/common_injector.dart';
import 'package:tmeny_flutter/di/data_injector.dart';
import 'package:tmeny_flutter/user/authentication/di/authentication_injector.dart';
import 'localizations_container.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton(LocalizationsContainer());

  injector.pushNewScope();
  await registerAppDependencies();
}

//TODO:use this func with AuthLogout func to resetScope.
Future<void> resetScopeDependencies() async {
  await injector.resetScope();
  await registerAppDependencies();
}

Future<void> registerAppDependencies() async {
  DataDi.initialize();
  CommonDi.initialize();
  UserAuthenticationDi.initialize();


}
