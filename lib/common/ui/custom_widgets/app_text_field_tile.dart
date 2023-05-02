import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmeny_flutter/common/utils/app_material/text_fields/app_text_form_field.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

class AppTextFieldTile extends StatelessWidget {
  const AppTextFieldTile(
      {Key? key,
      required this.label,
      required this.hintText,
      this.onchange,
      this.validator,
      this.obscureText = false,
      this.inputFormatters,
      this.suffix,
      this.maxLength})
      : super(key: key);

  final String label;
  final String hintText;
  final bool obscureText;
  final void Function(String)? onchange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: PaddingDimensions.normal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyles.medium(
                  color: AppColors.neutral_900, fontSize: Dimensions.normal)),
          SizedBox(
            height: PaddingDimensions.normal,
          ),
          AppTextFormField(
            inputFormatters: inputFormatters,
            hint: hintText,
            onchange: onchange,
            validator: validator,
            obscureText: obscureText,
            suffix: suffix,
            maxLength: maxLength,
            maxErrorLines: 5,
          ),
        ],
      ),
    );
  }
}
