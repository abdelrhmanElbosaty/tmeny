import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

class PinCodeWidget extends StatelessWidget {
  PinCodeWidget(
      {Key? key,
      required this.hasError,
      required this.onChange,
      this.validator,
      required this.codeController,
      this.length = 6,
      this.borderColor,
      this.disabledBorderColor,
      this.focusBorderColor,
      this.fieldColor,
      this.hintCharacter})
      : super(key: key);
  final bool hasError;
  final void Function(String value) onChange;
  final String? Function(String?)? validator;
  final TextEditingController codeController;
  final int length;
  final Color? borderColor;
  final Color? disabledBorderColor;
  final Color? focusBorderColor;
  final Color? fieldColor;
  final String? hintCharacter;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
        ],
        appContext: context,
        length: length,
        focusNode: _focusNode,
        enableActiveFill: true,
        keyboardType: TextInputType.phone,
        textStyle: TextStyles.medium(
          fontSize: Dimensions.large,
          color: AppColors.neutral_900,
        ),
        hintCharacter: hintCharacter ?? '__',
        hintStyle: const TextStyle(
          height: 2,
        ),
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldHeight: 48,
            fieldWidth: 48,
            activeColor: hasError ? AppColors.danger_600 : borderColor ?? AppColors.neutral_40,
            disabledColor: disabledBorderColor ?? AppColors.neutral_30,
            activeFillColor:
                fieldColor ?? AppColors.forthColor,
            inactiveFillColor:
                fieldColor ?? AppColors.forthColor,
            selectedFillColor:
                fieldColor ?? AppColors.forthColor,
            borderWidth: 1,
            inactiveColor:
                fieldColor ?? AppColors.forthColor,
            selectedColor: AppColors.neutral_50,
            errorBorderColor: AppColors.danger_600,
            borderRadius: BorderRadius.circular(8),
            fieldOuterPadding:
                EdgeInsets.symmetric(horizontal: PaddingDimensions.small)),
        animationType: AnimationType.fade,
        onChanged: onChange,
        showCursor: true,
        cursorColor: AppColors.primary_500,
        validator: validator,
        mainAxisAlignment: MainAxisAlignment.center,
        controller: codeController,
        autoDisposeControllers: false,
        cursorHeight: 17,
      ),
    );
  }
}
