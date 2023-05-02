
import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';
import 'package:tmeny_flutter/data/preferences/preferences_helper.dart';

class CommonCachedUserDataUseCase {
  final PreferencesHelper _preferencesHelper;

  CommonCachedUserDataUseCase(this._preferencesHelper);

  Future<CachedUserData> execute() async {
    final result = await _preferencesHelper.getUserData();
    return result;
  }
}
