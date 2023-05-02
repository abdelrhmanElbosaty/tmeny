import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/blocs/app_language/app_language_bloc.dart';
import 'package:tmeny_flutter/common/blocs/app_language/app_language_event.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/custom_divider.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/radio_button/custom_radio_button_tile.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_material/bottom_sheet/app_bottom_sheet_common.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  static showLanguageBottomSheet(context) async {
    return await appBottomSheetCommon(
      context,
      builder: (context) {
        return const LanguageBottomSheet();
      },
    );
  }

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String? _language;

  @override
  void initState() {
    _getAppLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: PaddingDimensions.large),
            width: 70,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.dividerColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(PaddingDimensions.normal),
            child: Text(
              CommonLocalizer.changeLanguage,
              style: TextStyles.medium(fontSize: Dimensions.xxLarge),
            ),
          ),
          // const Divider(color: AppColors.dividerGryColor, ),
          CustomDivider(horizontalPadding: PaddingDimensions.xxLarge),
          CustomRadioTile(
              value: "en",
              onChanged: onChanged,
              groupValue: _language,
              title: text('English')),
          CustomRadioTile(
              value: "ar",
              onChanged: onChanged,
              groupValue: _language,
              title: text('العربية')),

          Padding(
            padding: EdgeInsets.symmetric(vertical: PaddingDimensions.xLarge),
            child: AppMaterialButtons.primaryButton(
              margin:
                  EdgeInsets.symmetric(horizontal: PaddingDimensions.xLarge),
              text: CommonLocalizer.confirm,
              onPressed: onLangButtonPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget text(String title) {
    return Text(
      title,
      style: TextStyles.medium(fontSize: Dimensions.large),
    );
  }

  void onChanged(String? value) {
    _language = value;
    setState(() {});
  }

  void _getAppLanguage() {
    _language =
        BlocProvider.of<AppLanguageBloc>(context).state.locale.languageCode;
  }

  void onLangButtonPressed() {
    BlocProvider.of<AppLanguageBloc>(context).add(
        ChangeAppLanguage(Locale.fromSubtags(languageCode: _language ?? 'en')));
    Navigator.of(context).pop(context);
  }
}
