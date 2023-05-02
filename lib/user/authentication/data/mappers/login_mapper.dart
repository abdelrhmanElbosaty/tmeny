

import 'package:tmeny_flutter/common/domain/models/token.dart';
import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';
import 'package:tmeny_flutter/user/authentication/data/models/login/api_login_result.dart';

extension ConvertApiUserLoginDataToLoginInput on EmailAndPasswordLoginData {
  CachedUserData map() {
    return CachedUserData(
        id: id ?? '', token: Token(token ?? '', isCompletedRegister ?? false));
  }
}
