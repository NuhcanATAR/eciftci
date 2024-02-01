import 'package:eciftci/feature/mainview/mainbottommenu/bottommenu_view.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginRouterView extends StatefulWidget {
  const LoginRouterView({super.key});

  @override
  State<LoginRouterView> createState() => _LoginRouterViewState();
}

class _LoginRouterViewState extends State<LoginRouterView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomMenuView(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: LabelMediumBlackBoldText(
                text: "Bilgiler Kontrol Ediliyor",
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: LabelMediumGreyText(
                text: "Lütfen Bekleyiniz",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
