import 'package:flutter/material.dart';

import '../../../../../../product/widget/text_widget/body_medium_text.dart';

class PlotsTitleWidget extends StatelessWidget {
  const PlotsTitleWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: BodyMediumBlackBoldText(
            text: data['TITLE'], textAlign: TextAlign.left),
      ),
    );
  }
}
