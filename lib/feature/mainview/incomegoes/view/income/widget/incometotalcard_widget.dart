import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/title_medium_text.dart';
import 'package:flutter/material.dart';

class IncomeTotalCardWidget extends StatelessWidget {
  const IncomeTotalCardWidget(
      {required this.calculateTotalPrice,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic calculateTotalPrice;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

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
              future: calculateTotalPrice(),
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
