import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmeny_flutter/common/utils/common.dart';
import 'package:tmeny_flutter/common/utils/constants.dart';
import 'package:tmeny_flutter/data/preferences/preferences_helper.dart';
import 'package:tmeny_flutter/data/preferences/preferences_helper_imp.dart';
import 'package:tmeny_flutter/data/preferences/shared_preferences_helper.dart';
import 'package:tmeny_flutter/data/preferences/shared_preferences_helper_imp.dart';
import 'app_injector.dart';
import 'localizations_container.dart';

class DataDi {
  static Future<void> initialize() async {
    injector.registerLazySingleton(() => const FlutterSecureStorage());

    injector.registerLazySingleton<PreferencesHelper>(
        () => PreferencesHelperImp(injector()));

    injector.registerLazySingletonAsync<SharedPreferences>(
        () => SharedPreferences.getInstance());

    injector.registerLazySingleton<ShardPreferencesHelper>(
        () => SharedPreferencesHelperImp());

    injector.registerLazySingleton<Link>(() {
      final link = Link.from([
        HttpLink(
          Constants.endpoint,
          defaultHeaders: {
            "lang": _getCountryLanguage(),
            "Apollo-Require-Preflight": "true",
          },
        )
      ]);
      final authLink = AuthLink(getToken: () async {
        final preferencesHelper = injector.get<PreferencesHelper>();
        final token = await preferencesHelper.getToken();
        // final userId = await preferencesHelper.getId();
        // print("--->${token?.token}");
        // print("--->id => $userId");
        if (token?.token.isNotEmpty ?? false) {
          logDebug("Token :- ${token?.token}");
          return 'bearer ${token?.token}';
        } else {
          return null;
        }
      });

      final concatLink = authLink.concat(link);

      final webSocketLink = WebSocketLink(Constants.subscriptionLink,
          config:
              const SocketClientConfig(initialPayload: authenticationHeader));

      final x = Link.split(
          (request) => request.isSubscription, webSocketLink, concatLink);
      return x;
    });

    injector.registerLazySingleton(() => GraphQLClient(
          link: injector(),
          cache: GraphQLCache(),
        ));
  }

  static Future<Map<String, dynamic>> authenticationHeader() async {
    final preferencesHelper = injector.get<PreferencesHelper>();
    final token = await preferencesHelper.getToken();
    if (token?.token.isNotEmpty ?? false) {
      return {"Authorization": "bearer ${token?.token}"};
    } else {
      return {};
    }
  }

  static String _getCountryLanguage() {
    final String country = Platform.localeName.split("-").last;
    final String appLanguage = isAppInArabic() ? "ar" : "en";
    return '$country-$appLanguage';
  }
}
