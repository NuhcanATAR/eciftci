import 'package:flutter/material.dart';

import '../../../../../../../../product/constants/color_constant.dart';
import '../../../../../../../../product/widget/text_widget/title_medium_text.dart';

class TotalIncomeCardWidget extends StatelessWidget {
  const TotalIncomeCardWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.calculateFilterTotalPrice,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic calculateFilterTotalPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: maxWidth,
        height: dynamicHeight(0.15),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: MainAppColorConstant.mainColorBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: FutureBuilder<int>(
              future: calculateFilterTotalPrice(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                } else if (snapshot.hasError) {
                  return const TitleMediumWhiteText(
                      text: "Hata oluştu!", textAlign: TextAlign.left);
                } else {
                  return TitleMediumWhiteText(
                      text: "${snapshot.data}₺ Gelir",
                      textAlign: TextAlign.left);
                }
              },
            )),
      ),
    );
  }
}
