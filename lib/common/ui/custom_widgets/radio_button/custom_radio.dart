import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  const CustomRadio(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 16,
      width: 16,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.neutral_0,
          border: Border.all(width: 1, color: AppColors.neutral_100)),
      child: Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.transparent,
        ),
        child: Radio(
            activeColor: AppColors.primary_500,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            toggleable: true,
            visualDensity: VisualDensity.compact,
            overlayColor: MaterialStateColor.resolveWith(
                (states) => AppColors.neutral_100),
            value: value,
            groupValue: groupValue,
            onChanged: onChanged),
      ),
    );
  }
}

