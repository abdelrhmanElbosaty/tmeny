import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/checkbox_tile/custom_check_box_tile.dart';
 import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'drop_down.dart';

class MultiselectDropDown extends StatefulWidget {
  const MultiselectDropDown({Key? key}) : super(key: key);

  @override
  State<MultiselectDropDown> createState() => _MultiselectDropDownState();
}

class _MultiselectDropDownState extends State<MultiselectDropDown> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
  ];
  List<String> selectedItems = [];

  int progressIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralBackground,
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButtonHideUnderline(
              child: CustomDropdownButton(
                isExpanded: true,
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Select Items',
                    style: TextStyles.regular(
                        color: AppColors.neutral_70,
                        fontSize: Dimensions.normal),
                  ),
                ),
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    //disable default onTap to avoid closing menu when selecting an item
                    enabled: false,
                    child: StatefulBuilder(
                      builder: (context, menuSetState) {
                        final isSelected = selectedItems.contains(item);
                        return CustomCheckBoxTile(
                          value: isSelected,
                          title: Text(item,
                              style: TextStyles.regular(
                                  fontSize: Dimensions.normal,
                                  color: AppColors.neutral_700)),
                          onChanged: (value) {
                            isSelected
                                ? selectedItems.remove(item)
                                : selectedItems.add(item);
                            setState(() {});
                            menuSetState(() {});
                          },
                        );
                      },
                    ),
                  );
                }).toList(),
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (value) {},
                selectedItemBuilder: (context) {
                  return items.map(
                    (item) {
                      return Wrap(
                          children: selectedItems.map((e) {
                        return InkWell(
                          onTap: () {
                            selectedItems.remove(e);
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: AppColors.primary_50,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.primary_100,
                                )),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(e,
                                    style: TextStyles.regular(
                                        fontSize: Dimensions.normal,
                                        color: AppColors.primary_400)),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.close,
                                    size: 15, color: AppColors.primary_200),
                              ],
                            ),
                          ),
                        );
                      }).toList());
                    },
                  ).toList();
                },
                dropdownStyleData: DropdownStyleData(
                  maxHeight: MediaQuery.of(context).size.height * .3,
                  elevation: 1,
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    thickness: MaterialStateProperty.all<double>(8),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.neutral_30),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    color: AppColors.forthColor,
                    border: Border.all(color: AppColors.neutral_30),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 100,
          ),

          Row(
            children: List<Widget>.generate(
                3,
                (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: progressIndex == index ? 40 : 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                    )).toList(),
          ),

          // [].

          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: progressIndex == 0 ? 20 : 40,
            height: 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (progressIndex > 2) {
            progressIndex = 0;
          } else {
            progressIndex++;
          }
          print(progressIndex);
          setState(() {});
        },
      ),
    );
  }
}

