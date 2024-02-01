import 'package:eciftci/product/enums/logregpass_enum/password_enum/password_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: BodyMediumBlackBoldText(
            text: PasswordViewStrings.titleText.value,
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: LabelMediumBlackText(
            text: PasswordViewStrings.subTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
