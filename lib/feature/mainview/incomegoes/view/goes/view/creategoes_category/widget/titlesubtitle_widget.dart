import 'package:eciftci/product/enums/mainview_enum/maingoes_enum/goescategory_enum/goescategory_enum.dart';
import 'package:flutter/material.dart';

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
              text: GoesCategoryViewStrings.createGoesTitleText.value,
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
              text: GoesCategoryViewStrings.createGoesSubTitleText.value,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
