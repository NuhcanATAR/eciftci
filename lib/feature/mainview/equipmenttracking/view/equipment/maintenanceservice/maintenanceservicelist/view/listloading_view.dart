import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MaintenanceServiceListLoadingView extends StatelessWidget {
  const MaintenanceServiceListLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // img
        LoadingAnimationWidget.hexagonDots(
          color: MainAppColorConstant.mainColorBackground,
          size: 45,
        ),
        // title
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 5),
          child: BodyMediumBlackBoldText(
            text: "Yükleniyor",
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
    );
  }
}
