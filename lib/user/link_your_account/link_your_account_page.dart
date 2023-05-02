import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_alerts/app_alert.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/icons_paths.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/user/authentication/ui/widgets/link_account_tile.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class LinkYourAccountPage extends StatefulWidget {
  const LinkYourAccountPage({Key? key}) : super(key: key);

  @override
  State<LinkYourAccountPage> createState() => _LinkYourAccountPageState();
}

class _LinkYourAccountPageState extends State<LinkYourAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
          context: context, title: 'link your account', useCloseButton: true),
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(children: [
          LinkAccountTile(
            text: AuthenticationLocalizer.google,
            isLinked: true,
            leadingIcon: IconsPaths.google,
            onPress: () {
              AppAlerts.footerAlert(
                context,
                primaryButtonText: CommonLocalizer.confirm,
                onPrimaryButtonPressed: (){
                 Navigator.of(context).pop();
                 AppAlerts.confirmRemoveLinkAccountAlertDialog(context);
                }
              );
            },
          ),
          if (Platform.isIOS) ...[
            LinkAccountTile(
              text: AuthenticationLocalizer.apple,
              isLinked: false,
              leadingIconColor: AppColors.blackColor,
              leadingIcon: IconsPaths.apple,
              onPress: () {},
            ),
          ],
          LinkAccountTile(
            text: AuthenticationLocalizer.facebook,
            isLinked: false,
            leadingIcon: IconsPaths.facebook,
            leadingIconColor: AppColors.blueColor,
            onPress: () {},
          ),
          LinkAccountTile(
            text: AuthenticationLocalizer.twitter,
            isLinked: false,
            leadingIcon: IconsPaths.twitterCircle,
            onPress: () {},
          ),
        ]),
      ),
    );
  }
}
