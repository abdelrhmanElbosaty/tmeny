import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class CustomCheckBoxTile extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final Widget title;
  final EdgeInsetsGeometry? paddingInsets;

  const CustomCheckBoxTile(
      {super.key,
        required this.value,
        this.onChanged,
        required this.title,
        this.paddingInsets});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          unselectedWidgetColor: AppColors.neutral_50,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: AppColors.neutral_20,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          listTileTheme: const ListTileThemeData(horizontalTitleGap: 5,),
          radioTheme: const RadioThemeData(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),
      child: CheckboxListTile(
          value: value,
          onChanged: onChanged,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: AppColors.primary_500,
          contentPadding: paddingInsets,
          checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          title: title),
    );
  }
}
