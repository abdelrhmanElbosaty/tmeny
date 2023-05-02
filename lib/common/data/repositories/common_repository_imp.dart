import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tmeny_flutter/common/data/graphql/common_requests.dart';
import 'package:tmeny_flutter/common/data/models/logout/api_logout_input.dart';
import 'package:tmeny_flutter/common/data/models/logout/api_logout_result.dart';
import 'package:tmeny_flutter/common/data/models/update_fcm_token/api_update_fcm_token_result.dart';
import 'package:tmeny_flutter/common/domain/exceptions/exceptions.dart';
import 'package:tmeny_flutter/common/domain/exceptions/status_codes.dart';
import 'package:tmeny_flutter/common/domain/inputs/upload_input.dart';
import 'package:tmeny_flutter/common/domain/repositories/common_repository.dart';
import 'package:tmeny_flutter/data/utils/graphql_extensions.dart';

class CommonRepositoryImp implements CommonRepository {
  final GraphQLClient _graphQLClient;
  CommonRepositoryImp(this._graphQLClient);

  @override
  Future<void> logout() async {
    final result = await _graphQLClient.perform(
        mutation: logoutMutation,
        variables: ApiLogoutInput(getDeviceType()).toJson());
    if (result.hasException || result.data == null) {
      throw const ServerException();
    } else {
      final request = ApiLogoutData.fromJson(result.data!).logout;

      if (request?.code == StatusCodes.success) {
        return;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }


  @override
  Future<String> uploadFile(UploadInput input) async {

    // final result = await _graphQLClient.perform(
    //     mutation: uploadMutation,
    //     variables: (await input.map()).toJson()
    // );
    //
    //
    // // print(result);
    // if (result.hasException || result.data == null) {
    //   throw const ServerException();
    // } else {
    //   final request = UploadFileResult.fromJson(result.data!).uploadFile;
    //
    //   if (request?.code == StatusCodes.success) {
    //     return request?.data ?? "";
    //   } else {
    //     throw ApiRequestException(
    //         request?.code ?? StatusCodes.unknown,
    //         request?.message ?? ""
    //     );
    //   }
    // }
    return '';
  }

  @override
  Future<void> updateFcmToken(String fcmToken) async {
    final DeviceEnum device;
    if (Platform.isIOS) {
      device = DeviceEnum.IOS;
    } else {
      device = DeviceEnum.ANDROID;
    }
    final result = await _graphQLClient.perform(
        mutation: updateFcmTokenMutation,
        variables: {
          "fcmToken" : fcmToken,
          "device": device.name,
        }
    );
    if (result.hasException || result.data == null) {
      throw const ServerException();
    } else {
      final request = UpdateFcmTokenResult.fromJson(result.data!)
          .updateFcmToken;

      if (request?.code == StatusCodes.success) {
        return;
      } else {
        throw ApiRequestException(
          request?.code ?? StatusCodes.unknown,
          request?.message ?? "",
        );
      }
    }
  }

}
