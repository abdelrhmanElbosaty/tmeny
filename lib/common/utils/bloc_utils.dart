import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tmeny_flutter/common/domain/exceptions/exceptions.dart';
import 'package:tmeny_flutter/common/utils/common.dart';
import 'localization/common_localizer.dart';

Future<void> collect<T>({
  required Future<void> Function() task,
  void Function(String)? onError,
  void Function(dynamic)? catchError,
}) async {
  try {
    await task();
  } on ApiRequestException catch (e) {
    if (onError != null && e.errorMessage.isNotEmpty) {
      onError(e.errorMessage);
    }
    if (catchError != null) {
      catchError(e.errorMessage);
    }
  } on ServerException catch (e) {
    if (onError != null) {
      onError(CommonLocalizer.serverError);
    }
    if (catchError != null) {
      catchError(e);
    }
  } catch (e) {
    logDebug(e);
    if (onError != null) {
      onError(CommonLocalizer.unexpectedError);
    }
    if (catchError != null) {
      catchError(e);
    }
  }
}
