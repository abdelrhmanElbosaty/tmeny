
import 'package:tmeny_flutter/data/preferences/preferences_helper.dart';

class IsAuthenticatedUseCase {
  final PreferencesHelper _preferencesHelper;

  IsAuthenticatedUseCase(this._preferencesHelper);

  Future<bool> execute() async {
    final token = await _preferencesHelper.getToken();
    if (
    // (token?.isCompleteRegister ?? false) &&
        (token?.token.isNotEmpty ?? false)) {
      return true;
    }
    return false;
  }
}
