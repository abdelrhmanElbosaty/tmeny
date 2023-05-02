import 'package:eraser/eraser.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tmeny_flutter/common/domain/exceptions/exceptions.dart';
import 'package:tmeny_flutter/common/domain/exceptions/status_codes.dart';
import 'package:tmeny_flutter/common/domain/repositories/common_repository.dart';
import 'package:tmeny_flutter/common/domain/use_cases/delete_token_use_case.dart';
import 'package:tmeny_flutter/common/utils/common.dart';


class CommonLogoutUseCase {
  final CommonRepository _repository;
  final DeleteCachedUserUseCase _deleteTokenUseCase;

  CommonLogoutUseCase(this._repository, this._deleteTokenUseCase);

  final googleSignIn = GoogleSignIn(scopes: [
    "email",
    "profile",
  ]);

  Future<void> execute() async {
    await _facebookLogout();
    await _googleLogout();
    await _logout();
    clearAllNotification();
  }

  Future<void> _logout() async {
    try {
      await _repository.logout();
      await _deleteCachedUser();
    } on ApiRequestException catch (e) {
      if (e.statusCode == StatusCodes.unauthorizedCode) {
        return;
      } else {
        rethrow;
      }
    }
  }

  Future<void> _deleteCachedUser() async {
    await _deleteTokenUseCase.execute();
  }

  Future<void> _googleLogout() async {
    try {
      await googleSignIn.signOut();
    } catch (e) {
      logDebug(e);
    }
  }

  Future<void> _facebookLogout() async {
    try {
      await FacebookAuth.instance.logOut();
    } catch (e) {
      logDebug(e);
    }
  }

  void clearAllNotification() {
    Eraser.clearAllAppNotifications();
  }
}
