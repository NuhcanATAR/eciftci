import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class MaintenanceServiceExplanationWidget extends StatelessWidget {
  const MaintenanceServiceExplanationWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: maxWidth,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: LabelMediumBlackBoldText(
                text: "Açıklama",
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            width: maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: LabelMediumBlackText(
                text: data['EXPLANATION'],
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
