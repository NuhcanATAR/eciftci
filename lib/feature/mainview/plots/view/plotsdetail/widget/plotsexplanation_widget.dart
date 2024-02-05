import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsExplanationWidget extends StatelessWidget {
  const PlotsExplanationWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: LabelMediumBlackText(
            text: data['EXPLANATION'], textAlign: TextAlign.left),
      ),
    );
  }
}
