import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../../../product/widget/text_widget/body_medium_text.dart';

class IncomeCategoryLoadingListView extends StatelessWidget {
  const IncomeCategoryLoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            LoadingAnimationWidget.hexagonDots(
              color: MainAppColorConstant.mainColorBackground,
              size: 45,
            ),
            // title
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: BodyMediumBlackBoldText(
                text: "Kategoriler Yükleniyor",
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: LabelMediumBlackText(
                text: "Lütfen Bekleyiniz...",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
