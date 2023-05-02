
import 'package:tmeny_flutter/common/domain/models/token.dart';

import 'models/cached_user_data.dart';
import 'models/local_preferences.dart';

abstract class PreferencesHelper {
  Future<void> setId(String id);

  Future<String?> getId();

  Future<void> setToken(Token token);

  Future<Token?> getToken();

  Future<void> deleteToken();

  // Future<void> setLanguage(String language);
  // Future<String?> getLanguage();

  Future<CachedUserData> getUserData();
  Future<void> setUserData(CachedUserData data);
  Future<void> deleteUserData();



  Future<void> setUserLocalPreferences(LocalPreferences preferences);

  Future<LocalPreferences> getUserLocalPreferences();
}
