import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../product/enums/mainview_enum/incomecategory_enum/incomecategory_enum.dart';

class IncomeCategoryListErrorView extends StatelessWidget {
  const IncomeCategoryListErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: AppIncomeGoesImgConstant.errorList.toImg,
            ),
            // title
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: BodyMediumBlackBoldText(
                text: IncomeCategoryViewStrings.listIncomeErrorTitleText.value,
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: LabelMediumBlackText(
                text:
                    IncomeCategoryViewStrings.listIncomeErrorSubTitleText.value,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
