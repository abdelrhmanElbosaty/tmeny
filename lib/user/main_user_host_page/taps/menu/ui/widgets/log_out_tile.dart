import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_states.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/custom_list_tile.dart';

class LogOutTile extends StatelessWidget {
  const LogOutTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthState>(
      builder: (context, state) {
        if (state is GuestState) {
          return CustomListTile(
            onTap: () => AuthenticationBloc.of(context).add(AuthRestartEvent()),
            title: "Log In",
            icon: Iconsax.logout,
          );
        }
        return CustomListTile(
          onTap: () => AuthenticationBloc.of(context).add(LoggedOutEvent()),
          title: CommonLocalizer.logOut,
          icon: Iconsax.logout,
        );
      },
    );
  }
}
