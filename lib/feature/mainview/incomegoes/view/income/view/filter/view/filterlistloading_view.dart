import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../product/constants/image_constant.dart';
import '../../../../../../../../product/widget/text_widget/body_medium_text.dart';

class FilterListLoadingView extends StatelessWidget {
  const FilterListLoadingView({super.key});

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
        const Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: BodyMediumBlackBoldText(
            text: "Yükleniyor",
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: LabelMediumBlackText(
            text: "Lütfen Bekleyiniz...",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
