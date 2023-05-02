import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Widget title;
  final EdgeInsetsGeometry? paddingInsets;

  const CustomRadioTile(
      {super.key,
        required this.value,
        this.groupValue,
        this.onChanged,
        required this.title,
        this.paddingInsets});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          unselectedWidgetColor: AppColors.dividerColor,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: AppColors.neutral_20,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          listTileTheme: const ListTileThemeData(horizontalTitleGap: 5,),
          radioTheme: const RadioThemeData(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

          )),
      child: RadioListTile(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: AppColors.primary_500,
          contentPadding: paddingInsets,

          title: title),
    );
  }
}
