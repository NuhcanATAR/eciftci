import 'package:flutter/material.dart';

import '../../../../../../../../product/widget/text_widget/body_medium_text.dart';
import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class IncomeTitleWidget extends StatelessWidget {
  const IncomeTitleWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: maxWidth,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: LabelMediumBlackBoldText(
                  text: "Gelir Başlığı",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              width: maxWidth,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: BodyMediumBlackText(
                  text: data['TITLE'],
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
