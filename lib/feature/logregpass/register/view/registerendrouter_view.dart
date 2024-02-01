import 'package:eciftci/feature/logregpass/register/view/registerend_view.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterEndRouterView extends StatelessWidget {
  const RegisterEndRouterView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterEndView(),
            ),
            (Route<dynamic> route) => false);
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // loading
            LoadingAnimationWidget.hexagonDots(
              color: MainAppColorConstant.mainColorBackground,
              size: 45,
            ),
            // title
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 5),
              child: BodyMediumBlackBoldText(
                text: "Bilgiler Kaydediliyor",
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: LabelMediumGreyText(
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
