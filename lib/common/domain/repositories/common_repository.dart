
import 'package:tmeny_flutter/common/domain/inputs/upload_input.dart';

abstract class CommonRepository {
  Future<String> uploadFile(UploadInput input);
  Future<void> updateFcmToken(String fcmToken);
  Future<void> logout();
}
