import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/custom_expansion_tile/custom_expansion_tile.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class FAQs extends StatelessWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
        useCloseButton: true,
        context: context,
        title: 'FAQs',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomExpansionTile(
              title: 'How do I pay?',
              expansionListOfWidget: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PaddingDimensions.large,
                      vertical: PaddingDimensions.large),
                  child: Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
                    style: TextStyles.regular(
                      fontSize: Dimensions.large,
                    ),
                  ),
                )
              ],
            ),
            CustomExpansionTile(
              title: 'How do I use the Application?',
              expansionListOfWidget: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PaddingDimensions.large,
                      vertical: PaddingDimensions.large),
                  child: Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
                    style: TextStyles.regular(
                      fontSize: Dimensions.large,
                    ),
                  ),
                )
              ],
            ),
            CustomExpansionTile(
              title: 'What is Yolo ?',
              expansionListOfWidget: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PaddingDimensions.large,
                      vertical: PaddingDimensions.large),
                  child: Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
                    style: TextStyles.regular(
                      fontSize: Dimensions.large,
                    ),
                  ),
                )
              ],
            ),
            CustomExpansionTile(
              title: 'Can I book the whole tour?',
              expansionListOfWidget: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PaddingDimensions.large,
                      vertical: PaddingDimensions.large),
                  child: Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
                    style: TextStyles.regular(
                      fontSize: Dimensions.large,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
