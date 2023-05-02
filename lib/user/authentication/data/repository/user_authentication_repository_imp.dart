import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tmeny_flutter/common/domain/exceptions/exceptions.dart';
import 'package:tmeny_flutter/common/domain/exceptions/status_codes.dart';
import 'package:tmeny_flutter/common/domain/models/token.dart';
import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';
import 'package:tmeny_flutter/data/preferences/preferences_helper.dart';
import 'package:tmeny_flutter/data/utils/graphql_extensions.dart';
import 'package:tmeny_flutter/user/authentication/data/graphql/authentication_requests.dart';
import 'package:tmeny_flutter/user/authentication/data/mappers/login_mapper.dart';
import 'package:tmeny_flutter/user/authentication/data/mappers/social_login_mapper.dart';
import 'package:tmeny_flutter/user/authentication/data/mappers/user_register_mapper.dart';
import 'package:tmeny_flutter/user/authentication/data/models/forget_password/api_forget_password_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/forget_password/api_forget_password_result.dart';
import 'package:tmeny_flutter/user/authentication/data/models/forget_password/api_verification_forget_password_result.dart';
import 'package:tmeny_flutter/user/authentication/data/models/forget_password/api_verify_forget_password_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/forget_password/update_password/api_update_password_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/forget_password/update_password/api_update_password_result.dart';
import 'package:tmeny_flutter/user/authentication/data/models/login/api_login_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/login/api_login_result.dart';
import 'package:tmeny_flutter/user/authentication/data/models/register/api_register_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/register/api_register_result.dart';
import 'package:tmeny_flutter/user/authentication/data/models/resend_email_verification_code_input/api_resend_email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/resend_email_verification_code_input/api_resend_email_verification_code_result.dart';
import 'package:tmeny_flutter/user/authentication/data/models/social_login/api_social_login_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/social_login/api_social_login_result.dart';
import 'package:tmeny_flutter/user/authentication/data/models/verify_email/api_email_user_register_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/data/models/verify_email/api_user_verification_result.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_login_input/user_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_register_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/social/social_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/update_password/update_password_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';


class UserAuthenticationRepositoryImp implements UserAuthenticationRepository {
  final PreferencesHelper _preferencesHelper;
  final GraphQLClient _graphQLClient;

  const UserAuthenticationRepositoryImp(
      this._preferencesHelper, this._graphQLClient);

  @override
  Future<bool> userRegister(UserRegisterInput input) async {
    final result = await _graphQLClient
        .perform(mutation: registerAsTouristMutation, variables: {
      "input": ApiRegisterInput.fromRegisterInput(input).toJsonWithoutNulls(),
    });
    if (result.hasException) {
      throw const ServerException();
    } else {
      final request =
          ApiUserRegisterResult.fromJson(result.data!).registerAsTourist;
      final bool? data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        // todo: update token here
        return data;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }

  @override
  Future<CachedUserData> getCacheUserData(UserRegisterInput input) async {
    return await _preferencesHelper.getUserData();
  }

  @override
  Future<CachedUserData> registerVerification(
      VerificationCodeInput input) async {
    final result = await _graphQLClient
        .perform(mutation: verifyTouristOtbByEmailMutation, variables: {
      "input":
          ApiEmailRegisterVerificationInput.fromEmailRegisterVerificationInput(
              input),
    });
    if (result.hasException) {
      throw const ServerException();
    } else {
      final request =
          ApiEmailUserRegisterVerificationResult.fromJson(result.data!)
              .verifyTouristByEmail;
      final data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        final cachedUserData = data.mapCachedUserData();
        await _setCachedUserData(cachedUserData);
        return cachedUserData;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }

  @override
  Future<bool> resendEmailVerificationCode(
      EmailVerificationCodeInput input) async {
    final result = await _graphQLClient
        .perform(mutation: resendEmailVerificationCodeMutation, variables: {
      "input": ApiResendEmailVerificationCodeInput
          .fromApiResendEmailVerificationCodeInput(input),
    });
    if (result.hasException) {
      throw const ServerException();
    } else {
      final request = ApiResendEmailVerificationCode.fromJson(result.data!)
          .resendEmailVerificationCode;
      final data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        return data;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }

  @override
  Future<CachedUserData> userLogin(UserLoginInput input) async {
    final result = await _graphQLClient.perform(
        mutation: emailAndPasswordLoginMutation,
        variables: {
          "input": ApiLoginInput.fromLoginInput(input).toJsonWithoutNulls()
        });
    if (result.hasException || result.data == null) {
      throw const ServerException();
    } else {
      final request =
          ApiUserLoginResult.fromJson(result.data!).emailAndPasswordLogin;
      final data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        final cachedUserData = data.map();
        await _setCachedUserData(cachedUserData);
        return cachedUserData;
      } else {
        throw ApiRequestException(
          request?.code ?? StatusCodes.unknown,
          request?.message ?? "",
        );
      }
    }
  }

  @override
  Future<CachedUserData> socialLogin(SocialLoginInput input) async {
    final result = await _graphQLClient.perform(
        mutation: socialLoginOrRegisterMutation, // edit
        variables: {
          "input": ApiSocialLoginInput.fromInput(input).toJsonWithoutNulls(),
        });
    if (result.hasException || result.data == null) {
      throw const ServerException();
    } else {
      final request = ApiSocialLoginOrRegisterResult.fromJson(result.data!)
          .socialLoginOrRegister;
      final data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        final cachedUserData = data.map();
        await _setCachedUserData(cachedUserData);
        return cachedUserData;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }

  @override
  Future<bool> forgetPassword(String email) async {
    final result = await _graphQLClient
        .perform(mutation: forgetPasswordMutation, variables: {
      "input": ApiForgetPasswordInput.fromForgetPasswordInput(email),
    });
    if (result.hasException) {
      throw const ServerException();
    } else {
      final request =
          ApiForgetPasswordResult.fromJson(result.data!).forgetPassword;
      final data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        return data;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }

  @override
  Future<bool> verifyForgetPasswordVerificationCode(
      VerificationCodeInput input) async {
    final result = await _graphQLClient
        .perform(mutation: verifyForgetPasswordCodeMutation, variables: {
      "input": ApiVerifyForgetPasswordVerificationCodeInput
          .fromApiVerifyForgetPasswordVerificationCodeInput(input),
    });
    if (result.hasException) {
      throw const ServerException();
    } else {
      final request = ApiForgetPasswordVerificationResult.fromJson(result.data!)
          .verifyForgetPasswordCode;
      final data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        return data;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }

  @override
  Future<CachedUserData> updatePassword(UserUpdatePasswordInput input) async {
    final result = await _graphQLClient
        .perform(mutation: resetPasswordMutation, variables: {
      "input": ApiUpdatePasswordInput.fromApiUpdatePasswordInput(input),
    });
    if (result.hasException) {
      throw const ServerException();
    } else {
      final request =
          ApiUpdatePasswordResult.fromJson(result.data!).resetPassword;
      final data = request?.data;
      if (request?.code == StatusCodes.success && data != null) {
        final CachedUserData cachedUserData = CachedUserData(
            id: data.id ?? '',
            token: Token(data.token, data.isCompletedRegister ?? false));
        await _setCachedUserData(cachedUserData);
        return cachedUserData;
      } else {
        throw ApiRequestException(
            request?.code ?? StatusCodes.unknown, request?.message ?? "");
      }
    }
  }

  Future<void> _setCachedUserData(CachedUserData data) async {
    await _preferencesHelper.setUserData(data);
  }
}
