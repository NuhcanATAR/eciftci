import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/maingoes_enum/goes_enum/goes_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class FilterListErrorView extends StatelessWidget {
  const FilterListErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // img
        Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: AppIncomeGoesImgConstant.errorList.toImg),
        // title
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: BodyMediumBlackBoldText(
            text: GoesViewStrings.filterListErrorTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: LabelMediumBlackText(
            text: GoesViewStrings.filterListErrorSubTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
