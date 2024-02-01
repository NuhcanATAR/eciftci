import 'package:eciftci/feature/logregpass/login/login_view.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/icon_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/password_enum/password_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ResetPasswordEndView extends StatelessWidget {
  const ResetPasswordEndView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Şifre Sıfırlama",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: ListView(
          children: <Widget>[
            // image
            buildImageWidget,
            // title & sub title
            buildTitleSubTitleWidget,
            // login button
            buildLoginButtonWidget(context),
          ],
        ),
      ),
    );
  }

  // image
  Widget get buildImageWidget => Padding(
        padding: const EdgeInsets.only(left: 140, right: 140, bottom: 15),
        child: AppForgotPassIcon.appSendMailSuccessIcon.toImg,
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: BodyMediumBlackBoldText(
              text: PasswordViewStrings.sendSuccessTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: LabelMediumBlackText(
              text: PasswordViewStrings.sendSuccessSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  // login button
  Widget buildLoginButtonWidget(context) => GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
              (Route<dynamic> route) => false);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MainAppColorConstant.mainColorBackground,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: LabelMediumWhiteText(
            text: PasswordViewStrings.loginBtnText.value,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
