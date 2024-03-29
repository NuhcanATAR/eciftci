import 'package:flutter/material.dart';

import '../../../../../../../../product/enums/mainview_enum/mainincome_enum/incomecategory_enum/incomecategory_enum.dart';
import '../../../../../../../../product/widget/text_widget/body_medium_text.dart';
import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({required this.maxWidth, super.key});

  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: BodyMediumBlackBoldText(
              text: IncomeCategoryViewStrings.updateIncomeTitleText.value,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // sub title
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: LabelMediumBlackText(
              text: IncomeCategoryViewStrings.updateIncomeSubTitleText.value,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
