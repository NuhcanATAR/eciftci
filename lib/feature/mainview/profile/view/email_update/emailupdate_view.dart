import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/profile_enum/profile_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProfileEmailUpdateView extends StatefulWidget {
  const ProfileEmailUpdateView({super.key});

  @override
  State<ProfileEmailUpdateView> createState() => _ProfileEmailUpdateViewState();
}

class _ProfileEmailUpdateViewState extends State<ProfileEmailUpdateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstant.mainColorBackground,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "E-mail Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // img
              buildImgWidget,
              // title
              buildTitleWidget,
              // description
              buildDescriptionWidget,
            ],
          ),
        ),
      ),
    );
  }

  // img
  Widget get buildImgWidget => Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: AppProfileImgConstant.emailWarningImg.toImg);

  // title
  Widget get buildTitleWidget => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: BodyMediumBlackBoldText(
          text: ProfileViewStrings.emilaUpdateTitleText.value,
          textAlign: TextAlign.center,
        ),
      );

  // description
  Widget get buildDescriptionWidget => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: LabelMediumBlackText(
          text: ProfileViewStrings.emailUpdateSubTitleText.value,
          textAlign: TextAlign.center,
        ),
      );
}
