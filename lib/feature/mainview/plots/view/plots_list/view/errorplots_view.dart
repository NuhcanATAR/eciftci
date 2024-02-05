import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../product/widget/text_widget/body_medium_text.dart';

class ErrorPlotsView extends StatelessWidget {
  const ErrorPlotsView(
      {required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // img
        Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AppPlotsImgConstant.errorList.toImg),
        // title
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BodyMediumBlackBoldText(
            text: title,
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: LabelMediumBlackText(
            text: subTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
