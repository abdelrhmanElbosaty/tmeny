import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/keyboard/keyboardoverlay.dart';
import 'text_field_utils.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  bool obscureText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final bool isDark;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final String? hint;
  final int maxErrorLines;
  final String? labelText;
  final Widget? suffix;
  final Color? borderColor;
  final Color? isShadowColor;
  final double? borderRaduis;
  final void Function(String)? onchange;
  final VoidCallback? onTap;
  final bool? isEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final Color? textColor;
  final double? contentPAdding;
  final FocusNode? focusNode;
  final bool? itIncludeTextDone;
  final AutovalidateMode? autoValidateMode;
  final double? errorTextFontSize;

  AppTextFormField(
      {Key? key,
      this.controller,
      this.obscureText = false,
      this.validator,
      this.maxLength,
      this.isDark = true,
      this.maxLines = 1,
      this.minLines,
      this.keyboardType,
      this.hint,
      this.maxErrorLines = 1,
      this.labelText,
      this.suffix,
      this.borderColor,
      this.isShadowColor,
      this.isEnabled,
      this.borderRaduis,
      this.onchange,
      this.onTap,
      this.inputFormatters,
      this.initialValue,
      this.textDirection,
      this.textColor,
      this.contentPAdding,
      this.focusNode,
      this.itIncludeTextDone,
      this.autoValidateMode,
      this.errorTextFontSize})
      : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isPasswordSecure = false;

  @override
  void initState() {
    _isPasswordSecure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: widget.isShadowColor ?? AppColors.neutral_0.withOpacity(0.0),
            blurRadius: 15.0,
            offset: const Offset(5, 18),
            // offset: Offset(0.0, 0.75)
          )
        ],
      ),
      child: TextFormField(
        autovalidateMode: widget.autoValidateMode,
        autofocus: false,
        focusNode: widget.focusNode,
        initialValue: widget.initialValue,
        cursorColor: AppColors.primaryColor,
        textDirection: widget.textDirection,
        enabled: widget.isEnabled,
        textCapitalization: TextCapitalization.none,
        keyboardType: widget.keyboardType,
        obscuringCharacter: "*",
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        decoration: authenticationInputDecoration(
            errorTextFontSize: widget.errorTextFontSize ?? Dimensions.normal,
            labelText: widget.labelText,
            borderRadius: widget.borderRaduis,
            borderColor: widget.borderColor,
            suffixIcon: widget.suffix == null && widget.obscureText == true
                ? _passwordSuffixIcon()
                : null,
            hintText: widget.hint,
            contentPadding: widget.contentPAdding,
            maxErrorLines: widget.maxErrorLines),
        obscureText: _isPasswordSecure,
        style: TextStyles.regular(
          color: widget.textColor ?? AppColors.neutral_900,
          fontSize: Dimensions.normal,
        ),
        validator: widget.validator,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        onChanged: widget.onchange,
        onTap: () {
          if (widget.itIncludeTextDone == null ||
              widget.itIncludeTextDone == false) {
          } else {
            widget.focusNode?.addListener(() {
              bool hasFocus = widget.focusNode!.hasFocus;
              if (hasFocus) {
                KeyboardOverlay.showOverlay(context);
              } else {
                KeyboardOverlay.removeOverlay();
              }
            });
          }
          widget.onTap;
        },
      ),
    );
  }

  Widget _passwordSuffixIcon() {
    return GestureDetector(
      onTap: () {
        if (_isPasswordSecure) {
          _isPasswordSecure = false;
        } else {
          _isPasswordSecure = true;
        }
        setState(() {});
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        _isPasswordSecure ? Iconsax.eye_slash : Iconsax.eye,
        color: AppColors.textPrimaryColor,
        size: 16,
      ),
    );
  }
}
