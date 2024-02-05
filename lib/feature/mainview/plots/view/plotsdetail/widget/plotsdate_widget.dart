import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsDateWidget extends StatelessWidget {
  const PlotsDateWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.date_range,
              color: MainAppColorConstant.mainColorBackground,
              size: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: LabelMediumBlackText(
                    text: "${data['DAY']}.${data['MONTH']}.${data['YEAR']}",
                    textAlign: TextAlign.left),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
