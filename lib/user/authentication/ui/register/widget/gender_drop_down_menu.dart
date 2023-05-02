
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
const List<String> list = <String>['Male', 'Female'];

class GenderDropDownMenu extends StatefulWidget {
  const GenderDropDownMenu({Key? key, required this.onSelect}) : super(key: key);
  final void Function(String? value) onSelect;

  @override
  State<GenderDropDownMenu> createState() => _GenderDropDownMenuState();
}

class _GenderDropDownMenuState extends State<GenderDropDownMenu> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: PaddingDimensions.normal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gender",
              style: TextStyles.medium(
                  color: AppColors.neutral_900, fontSize: Dimensions.normal)),
          SizedBox(
            height: PaddingDimensions.normal,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.neutral_50),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.xLarge,right: Dimensions.xxLarge),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    hint:   Text("Select your gender",style: TextStyle(color: AppColors.neutral_100,fontSize: Dimensions.xLarge),),
                    elevation: 16,
                    iconSize: 0,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                      widget.onSelect(dropdownValue);
                    },
                    borderRadius: BorderRadius.circular(10),
                    isExpanded: true,
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: AppColors.neutral_300),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Positioned(bottom: 10,right: 10,child: Icon(Iconsax.arrow_down_1),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
