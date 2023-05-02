import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
        useCloseButton: true,
        context: context,
        title: 'Contact Us',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PaddingDimensions.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: PaddingDimensions.large),
                child: Text(
                  'Contact Reason',
                  style: TextStyles.medium(
                      fontSize: Dimensions.normal,
                      color: AppColors.neutral_900),
                ),
              ),
              const MyDropDownMenuItem(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: PaddingDimensions.large,
                ),
                child: Text(
                  'Message',
                  style: TextStyles.medium(
                      fontSize: Dimensions.normal,
                      color: AppColors.neutral_900),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutral_30),
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.forthColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(PaddingDimensions.small),
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: 'write here...', border: InputBorder.none),
                    focusNode: primaryFocus,
                    maxLines: 3,
                  ),
                ),
              ),
              SizedBox(
                height: PaddingDimensions.xLarge,
              ),
              AppMaterialButtons.primaryButton(
                text: CommonLocalizer.send,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDropDownMenuItem extends StatefulWidget {
  const MyDropDownMenuItem({Key? key}) : super(key: key);

  @override
  State<MyDropDownMenuItem> createState() => _MyDropDownMenuItemState();
}

class _MyDropDownMenuItemState extends State<MyDropDownMenuItem> {
  String dropdownValue = 'Mecca';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.small),
      decoration: BoxDecoration(
        color: AppColors.forthColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.neutral_30,
        ),
      ),
      child: DropdownButton<String>(
        dropdownColor: AppColors.forthColor,
        elevation: 0,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(8),
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: <String>[
          'Mecca',
          'Jeddah',
          'Riyadh',
          'Dammam',
          'ElTaef',
          'ElSareqa',
          'Yanpo3',
          'ElMadena',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
