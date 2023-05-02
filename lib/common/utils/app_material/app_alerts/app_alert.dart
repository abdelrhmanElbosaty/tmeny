import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';


class AppAlerts extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final VoidCallback? primaryButtonTap;
  final bool showCloseButton;
  final String? primaryButtonText;
  final bool? canPop;
  final Widget? footer;
  final Widget? formFieldReview;

  const AppAlerts(
      {Key? key,
      this.title,
      this.subTitle,
      this.primaryButtonTap,
      this.showCloseButton = true,
      this.primaryButtonText,
      this.canPop,
      this.footer,
        this.formFieldReview,})
      : super(key: key);

  static void successAlertDialog(
    context, {
    VoidCallback? onPressSuccess,
    String? title,
    String? subTitle,
    String? primaryButtonText,
    bool? showCloseButton,
    bool? canPop,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AppAlerts(
            primaryButtonTap: onPressSuccess,
            showCloseButton: showCloseButton ?? true,
            title: title ?? CommonLocalizer.success,
            subTitle: subTitle,
            primaryButtonText: primaryButtonText,
            canPop: canPop);
      },
    );
  }

  static void hint(
    context, {
    VoidCallback? onPressSuccess,
    String? title,
    String? subTitle,
    bool? canPop,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AppAlerts(
            primaryButtonTap: onPressSuccess,
            title: title ?? "Error",
            subTitle: subTitle,
            canPop: canPop);
      },
    );
  }

  static void footerAlert(
    context, {
    VoidCallback? onPrimaryButtonPressed,
    String? title,
    String? subTitle,
    String? primaryButtonText,
    bool? showCloseButton,
    bool? canPop,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AppAlerts(
          showCloseButton: false,
          title: 'Are you sure to delete your account?',
          subTitle:
              'When you delete your account your profile, trips and booking will be permanently removed.',
          primaryButtonText: CommonLocalizer.confirm,
          canPop: true,
          footer: Row(
            children: [
              Expanded(
                child: AppMaterialButtons.outline(
                  height: 40,
                  fontSize: Dimensions.normal,
                  text: CommonLocalizer.cancel,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(
                width: Dimensions.small,
              ),
              Expanded(
                child: AppMaterialButtons.primaryButton(
                  height: 40,
                  fontSize: Dimensions.normal,
                  text: primaryButtonText ?? '',
                  onPressed: onPrimaryButtonPressed,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void confirmRemoveLinkAccountAlertDialog(
      context,
      {
        VoidCallback? onPressSuccess,
        String? title,
        String? subTitle,
        String? primaryButtonText,
        bool? showCloseButton,
        bool? canPop,
        Widget? formFieldReview,
      }
      )
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AppAlerts(primaryButtonTap: onPressSuccess,
          showCloseButton: false,
          title: 'Write the following to confirm delete your account',
          subTitle: '“I Confirm to delete my account”',
          primaryButtonText: CommonLocalizer.deleteAccount,
          canPop: true,
          formFieldReview: Padding(
            padding:  EdgeInsets.symmetric(vertical: PaddingDimensions.large),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text('write a review',),
                    SizedBox(height: Dimensions.large,),
                    TextField(
                      maxLines: 3,
                      decoration:InputDecoration(
                        hintText: 'write here...',
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(8)),),
                    ),
                  ],
                ),
          ),
          footer: Row(
            children: [
              AppMaterialButtons.outline(
                height: 40,
                fontSize: Dimensions.normal,
                text: CommonLocalizer.cancel,
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(
                width: Dimensions.small,
              ),
              Expanded(
                child: AppMaterialButtons.primaryButton(
                  height: 40,
                  fontSize: Dimensions.normal,
                  text: CommonLocalizer.deleteAccount,
                  onPressed: (){},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static const double _alertRadius = 8.0;
  static final RoundedRectangleBorder _alertRectangleBorder =
      RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(_alertRadius),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canPop ?? true,
      child: AlertDialog(
          insetPadding: EdgeInsets.all(PaddingDimensions.xLarge),
          contentPadding: EdgeInsets.symmetric(
              horizontal: PaddingDimensions.xLarge,
              vertical: PaddingDimensions.xLarge),
          shape: _alertRectangleBorder,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              showCloseButton
                  ? GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Iconsax.close_circle,
                            color: AppColors.primary_300,
                            size: 27,
                          )))
                  : const SizedBox(),
              title != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: TextStyles.bold(
                          height: 1.3,
                            fontSize: Dimensions.xLarge,
                            color: AppColors.neutral_900),
                      ),
                    )
                  : const SizedBox(),
              subTitle != null
                  ? Text(subTitle!,
                      textAlign: TextAlign.center,
                      style: TextStyles.medium(
                        height: 1.3,
                          fontSize: Dimensions.normal,
                          color: AppColors.neutral_900))
                  : const SizedBox(),
              const SizedBox(
                height: 30,
              ),
              formFieldReview!= null
                  ? formFieldReview!:const SizedBox(),
              footer != null
                  ? footer!
                  : AppMaterialButtons.primaryButton(
                      text: primaryButtonText ?? CommonLocalizer.done,
                      onPressed: primaryButtonTap,),
            ],
          ),
      ),
    );
  }
}
