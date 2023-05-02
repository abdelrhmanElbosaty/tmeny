
// extension ConvertApiRegisterResultToUserRegisterResult
//     on RegisterAsTouristData {
//   UserRegisterResult map() {
//     return UserRegisterResult(
//       id ?? '',
//       firstName ?? '',
//       lastName ?? '',
//     );
//   }
// }

import 'package:tmeny_flutter/common/domain/models/token.dart';
import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';

import '../models/verify_email/api_user_verification_result.dart';

extension ConvertApiRegisterVerificationResultToUserData
    on ApiVerificationUserData {
  CachedUserData mapCachedUserData() {
    return CachedUserData(id: id ?? '', token: Token(token?? '',isCompletedRegister ?? false));
  }
}
