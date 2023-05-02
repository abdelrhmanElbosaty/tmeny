

import 'package:tmeny_flutter/common/data/repositories/common_repository_imp.dart';
import 'package:tmeny_flutter/common/domain/repositories/common_repository.dart';
import 'package:tmeny_flutter/common/domain/use_cases/authentication/cached_user_data_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/authentication/is_user_authenticated_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/authentication/logout_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/delete_token_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/fcm_token_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/get_local_preferences_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/update_fcm_token_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/upload_use_case.dart';
import 'package:tmeny_flutter/di/app_injector.dart';

class CommonDi {
  CommonDi._();

  static Future<void> initialize() async {
    injector.registerLazySingleton<CommonRepository>(
        () => CommonRepositoryImp(injector()));
    injector.registerFactory(() => GetLocalPreferencesUseCase(injector()));
    injector.registerFactory(() => DeleteCachedUserUseCase(injector()));
    injector.registerFactory(() => FcmTokenUseCase());
    injector.registerFactory(() => UpdateFcmTokenUseCase(injector()));
    injector.registerFactory(() => UploadFileUseCase(injector()));

    injector.registerFactory(() => CommonCachedUserDataUseCase(injector()));
    injector.registerFactory(() => IsAuthenticatedUseCase(injector()));
    injector.registerFactory(() => CommonLogoutUseCase(injector(),injector()));

  }
}
