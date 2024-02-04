import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/goescategory_enum/goescategory_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class GoesCategoryListErrorView extends StatelessWidget {
  const GoesCategoryListErrorView({super.key});

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
                text: GoesCategoryViewStrings.listGoesErrorTitleText.value,
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: LabelMediumBlackText(
                text: GoesCategoryViewStrings.listGoesErrorSubTitleText.value,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
