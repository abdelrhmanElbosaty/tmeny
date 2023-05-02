import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/user/user_profile/ui/widgets/user_profile_form.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
          title: 'Profile', useCloseButton: true, context: context),
      body: SingleChildScrollView(
        child: Column(children: const [
          UserProfileForm(),
        ]),
      ),
    );
  }
}
