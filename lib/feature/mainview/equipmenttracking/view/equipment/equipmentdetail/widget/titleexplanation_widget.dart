import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentTitleExplanationWidget extends StatelessWidget {
  const EquipmentTitleExplanationWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BodyMediumBlackBoldText(
              text: data['TITLE'],
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // explanation
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: LabelMediumBlackText(
              text: data['EXPLANATION'],
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
