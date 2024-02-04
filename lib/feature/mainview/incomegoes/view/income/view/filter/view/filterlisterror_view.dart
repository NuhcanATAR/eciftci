import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../product/enums/mainview_enum/mainincome_enum/income_enum/income_enum.dart';

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
            text: IncomeViewStrings.filterListErrorTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: LabelMediumBlackText(
            text: IncomeViewStrings.filterListErrorSubTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
